# SQLite-Basic-Queries

- 這個倉庫展示我使用 SQLite 查詢 SQL 資料庫，撰寫各種查詢（如 SELECT、WHERE、GROUP BY、ORDER BY、CASE 條件式等），以取得、處理資料，或格式化查詢結果，以及關聯資料表（如UNION、JOIN等）的基礎能力。
- 本專案內包含數個 SQL 腳本與操作截圖，藉以展示如何在 SQLite 上進行各種查詢與資料合併的實作。
- 專案使用的資料庫「netflixdb」源於另一開源專案，請詳見以下「資料來源」項目。

---

## 概述

- **應用之知識/能力：**
  - **基礎查詢與篩選：** 使用 `SELECT`、`WHERE` 等語法進行基礎資料搜尋。
  - **子查詢：** 利用 Subquery 取得特定資料。
  - **資料合併：** 使用 `UNION` 與 `JOIN` 等語法整合不同資料表之間的項目。
  - **格式化輸出：** 調整查詢結果的呈現格式。

---
## 背景
這些專案是我在 [2025-02-25] 完成 [Udemy 上的「以 SQLite 入門 SQL | Introduction to SQL with SQLite」](https://www.udemy.com/course/introduction-to-sql-with-sqlite) 後，根據所學技術知識所完成的實作案例。該課程從 SQL 基本觀念、實作到測驗循序漸進，內容涵蓋建立學習環境、資料表選擇、運算符與函數的應用、排序、篩選、條件邏輯、分組與聚合、子查詢以及資料表關聯，學習在自己的電腦上建立 SQLite 環境，並掌握關聯式資料庫與 SQL 查詢語法等基礎技能。

---

## 專案結構

```
SQLite-Basic-Queries/
├── GlobalMoviesQuery.sql                   # 範例：篩選全球皆可觀賞之Netflix電影，依上架日期排序並格式化資料
├── CinePopularityRankings.sql             # 範例：以 JOIN 操作連結Netflix電影名稱與人氣高低
├── (待更新)                                # 範例：（預計更新）UNION 之應用
├── screenshots/                           # 各 scripts 操作截圖示例
│   ├── GlobalMoviesQuery 2025-02-25.png
│   └── CinePopularityRankings 2025-02-25.png
└── README.md                              # 本說明文件
```

### GlobalMoviesQuery.sql
- 根據「netflixdb」資料庫中 movie 資料表的 Netflix 電影資訊欄位（時長、上架日期）進行格式化後，篩選出具有「available_globally」標籤之項目，並加以排序。
- 亦可參考script內註解。
- 屬於 SELECT、Operators、Functions(如IFNULL、DATE)、篩選(WHERE)、排序(ORDER BY DESC) 等項目之基礎應用呈現。

### CinePopularityRankings
- 根據「netflixdb」資料庫中 view_summary 資料表的Netflix 電影觀影統計資料，連接 movie 資料表，輔以假設性之「人氣指數公式（以 hours_viewed、 cumulative_weeks_in_top10、 view_rank等變數為基礎）」進行計算，取前25名。
- 亦可參考script內註解。
- 屬於 Aggregate Functions(如SUM、AVG)、JOIN、GROUP BY(分組)、LIMIT、OFFSET 等項目之應用呈現。


---

## 使用說明

1. **下載資料庫：**
   請依據下方「資料來源」提供的連結下載原始資料庫「netflixdb」。

2. **運行查詢腳本：**
   - 使用相關工具開啟資料庫，執行 `SQLite-Basic-Queries` 資料夾內我的各個 `.sql` 腳本，以獲得對應結果。

3. **參考截圖：**  
   如有需要，可參考 `screenshots` 資料夾中的截圖，了解查詢腳本的執行效果。

---

## 資料來源

- 本專案使用的資料庫「netflixdb」源於一開源專案，該資料庫依據 **Apache License 2.0** 授權使用。**我並未修改原始的 .sqlite 資料庫檔案**，僅以其作為範例進行查詢腳本之撰寫。
- 原始資料庫下載連結：[netflixdb](https://github.com/lerocha/netflixdb.git)
- 原始作者： lerocha

- **授權說明：**  
  該資料庫授權條款為 [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0)。

---

## 授權與版權

- **資料庫來源授權：**  
  本專案使用的資料庫依據 **Apache License 2.0** 授權，所有原始的版權與授權聲明均已保留。  
  詳情請參考原始資料庫中的 LICENSE 文件或 [Apache License 2.0 網站](http://www.apache.org/licenses/LICENSE-2.0)。

- **本專案內容：**  
  本倉庫中的 `SQL 查詢腳本` 均由本人撰寫，僅作為學習與展示用途。

---

若有任何疑問或想討論之處，歡迎與我聯繫。

*首次建立：[2025-02-25]*
*最後更新: [2025-02-25]*
