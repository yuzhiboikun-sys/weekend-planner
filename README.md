# 周末安排表

这是一个纯静态的周末时间规划页面，默认使用浏览器 `localStorage` 保存数据；配置 Supabase 后可以通过邮箱登录，在多个设备之间同步安排和完成状态。

## 发布到 GitHub Pages

1. 将仓库默认分支设为 `main`，把本目录内容放在仓库根目录。
2. 推送后，`.github/workflows/pages.yml` 会自动部署到 GitHub Pages。
3. 在仓库 Settings → Pages 中确认 Source 使用 GitHub Actions。

## 开启多设备同步

1. 在 Supabase 新建项目，打开 SQL Editor，执行 `supabase/schema.sql`。
2. 在 Authentication → URL Configuration 中，将 Site URL 设置为 GitHub Pages 地址。
3. 编辑 `index.html` 顶部的 `SUPABASE_URL` 和 `SUPABASE_ANON_KEY`。只能使用 anon public key，不要放 service-role key。
4. 提交并推送后，点击页面右上角“云同步”，输入邮箱即可收到一次性登录链接。

未配置 Supabase 时，页面仍可离线使用；不同设备的数据不会自动合并。
