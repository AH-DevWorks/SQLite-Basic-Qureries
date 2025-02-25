/* GlobalMoviesQuery
1. 挑選資料：電影title、時長runtime及上映日期release_date
2. 格式化runtime：原runtime是「總分鐘數」，轉以「幾小時幾分鐘」之較常見易讀之形式呈現
3. 格式化release_date：原release_date是Unix時間。搭配DATE()將轉換為ISO 8601表示法，並將NULL欄位轉換為「-- No Info.」
4. 篩選出全球皆可觀賞(available_globally=1)之項目
5. 排序（依照上映日期新→舊；日期相同者，則依時長由短到長排序）
*/

SELECT title,
       (runtime / 60) || ' hr  ' || (runtime % 60) || ' min' AS runtime_formatted,
       IFNULL(DATE(release_date / 1000, 'unixepoch'), '-- No Info.') AS release_date_formatted
  FROM movie
 WHERE available_globally = 1
 ORDER BY release_date_formatted DESC,
          runtime;