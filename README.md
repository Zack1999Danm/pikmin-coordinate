# 皮克敏飛人｜全台座標資料庫

此網站由 GitHub Pages + Supabase 組成。

## 檔案
- `index.html`：公開查詢頁面與管理員介面
- `config.js`：Supabase 專案 URL 與 anon/public key
- `schema.sql`：資料表、安全規則與 120 筆初始座標

## 上線步驟概要
1. 在 Supabase 建立專案。
2. 在 Supabase SQL Editor 執行 `schema.sql`。
3. 在 Project Settings > API 複製 Project URL 與 anon/public key，填入 `config.js`。
4. 在 Supabase Authentication > Users 建立管理員使用者。
5. 在 SQL Editor 執行下列指令，把你的管理員帳號加入白名單（替換 Email）：
   ```sql
   insert into public.site_admins (user_id)
   select id from auth.users where email = '你的登入Email';
   ```
6. 將三個檔案上傳到 GitHub repository 根目錄。
7. GitHub repository > Settings > Pages > Deploy from a branch > `main` / `/ (root)` > Save。

## 安全注意
- `anon/public` key 是前端公開金鑰，搭配 RLS 才安全。
- **絕不可將 `service_role` key、資料庫密碼或管理員密碼放進 `config.js` 或 GitHub。**
- 只有 `site_admins` 資料表內的使用者 ID 可以新增、修改、刪除店家。
- 不要開放一般使用者註冊；管理員由 Supabase Dashboard 建立。
- 公開網站訪客可讀取店家資料。

## 初始資料
本次匯入 120 筆店家座標。若 SQL 重複執行，初始資料會再次插入，請避免重複執行 seed insert。
