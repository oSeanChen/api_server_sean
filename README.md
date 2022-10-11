# Hahow for Business Backend Engineer

## 啟動專案

- Rails version 6.1.7
- Ruby version 2.7.5

`bundle`

[專案 heroku 連結](https://api-server-sean.herokuapp.com)

## 專案的架構

建構一個教學平台的 api server，預計讓使用者建立相關課程、章節、單元以及內部的內容敘述，可透過這個介面可以讓不同平台進行資料的建立、讀取、修改、刪除等操作。

會建立三種 model 可以記錄相關的資料與關聯

- Course 課程
  - title, lecturer, description
    /api/v1/courses
- Chapter 章節
  - title, course_id, position
    /api/v1/courses/:id/chapters
- Unit 單元
  - title, description, content, chapter_id, position
    /api/v1/courses/:id/chapters/:id/units

## 使用到的第三方 Gem

#### rubocop

針對專案內所有檔案進行檢查的套件，會檢查撰寫的語法、邏輯是否有依照統一的格式去進行。幫你找出哪一個檔案哪一行的程式碼有需要調整。你也可以根據團隊或是個人的需求去進行調整，在根目錄的設定檔中加入哪些檔案不需要被檢查，或是移除內建那些你認為不需要的檢查條件。

#### 使用的好處

- 可以建立統一的 coding style
- 找到自己哪些地方語法錯誤
- 提供一些更精簡或是提升效能的寫法可以參考

#### rails-rspec

協助進行專案內的測試套件，可以針對特定檔案進行測試，可以不用自己手動進行功能的確認

#### 使用的好處

- 撰寫方法及閱讀起來好懂
- 透過撰寫測試來驅動開發 Test Driven Development
- 確認你寫的程式的正確，結果如你所預期，減少自行除錯的時間。
- 後續新加功能或改寫重構時，不會影響之前寫好的功能。

## 註解的原則

1. 進行複雜的邏輯運算中，可能出現一些特殊的常數或是運算的目的需要簡單標記就會使用。
2. 特殊的套件用法會註記

## 遇到的困難以及解決的方法

#### api 開發

因為沒有寫過純粹 api server，對比過去開發都是包含前端畫面一起的做法，不確定寫法上應該怎麼樣去調整。

-> 找到 rails 中有純粹撰寫 api 的 api-only 模式，並且參考[鐵人賽技術文章](https://ithelp.ithome.com.tw/articles/10268890)及 [為你自己學 ruby on rails](https://railsbook.tw/chapters/22-api-mode)等資料，對於基本的 postman 使用來測試 api、

#### rspec 基本單元測試

不熟悉 rspec 測試套件使用及相關測試方法

-> 透過 rspec 特快車教學影片及參考相關技術文件，對於測試套件及寫法有基礎的認識。

## 仍未解決的困難

1. 把課程內相關的章節及單元一同顯示在同一個 api 路徑
2. 同步建立 course, chapter, unit
   目前想到可能的做法

   - 把資料的新增修改刪除都放到同一個 controller 裡面去處理。
   - 把目前的 3 個 各自的 controller 都針資料修改去進行判斷

3. 利用測試來驅動開發，把每個使用到的 controller 及 model 部分先寫好測試再進行功能的開發
