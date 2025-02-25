/* CinePopularityRankings
【功能】：以 view_summary 為基礎計算「人氣分數」，選出前 25 部熱門電影，再與 movie 連接取出電影名稱。
1. Subquery 排除 movie_id 內為 NULL （無法對應到電影標題）的觀測值
2. 依 movie_id 分組，依據總觀看時數、累計 Top 10 週數以及平均排名等資料，輔以虛構之人氣計算公式，假設出人氣排名
   *人氣公式： popularity_score = ROUND((SUM(hours_viewed)/2000.0 + 5.5 * SUM(cumulative_weeks_in_top10)) / (AVG(view_rank) + 1) * 0.01, 2)
3. 剔除第1筆（分數異常過高），共取 25 筆，Outer Query再連結 movie 資料表，取得電影名稱 title後，依人氣分數（高到低）排序
*/

SELECT movie.title,
       view_summary.popularity_score
  FROM movie
       RIGHT JOIN
       (
           SELECT movie_id,
                  SUM(hours_viewed) AS total_hours,
                  SUM(cumulative_weeks_in_top10) AS total_weeks_top10,
                  AVG(view_rank) AS avg_view_rank,
                  ROUND( (SUM(hours_viewed / 2000.0) + 5.5 * SUM(cumulative_weeks_in_top10) ) / (AVG(view_rank) + 1) * 0.01, 2)
                  AS popularity_score
             FROM view_summary
            WHERE movie_id IS NOT NULL
            GROUP BY movie_id
            ORDER BY popularity_score DESC
            LIMIT 25
            OFFSET 1
       )
       view_summary ON movie.id = view_summary.movie_id
 ORDER BY view_summary.popularity_score DESC;
