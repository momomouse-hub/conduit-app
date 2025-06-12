# Conduit App（Rails 8）

RealWorld アプリケーション（[Conduit](https://demo.realworld.io/)）を Rails 8 で構築した学習用プロジェクトです。
認証機能付きブログアプリの基本機能を実装し、ログイン中のユーザーによる記事投稿や編集、一覧表示、ページネーションを可能にしています。

---

## 📦 主な機能

- ユーザー登録・ログイン・ログアウト（セッションベース認証）
- 記事の投稿・編集・削除（ログインユーザーのみ）
- 記事一覧ページ（最大5件表示＋ページネーション）
- 記事詳細ページ（著者の名前・タグの表示）
- Markdownによる本文入力（Redcarpet対応）

---

## 🛠️ 使用技術

- **Ruby 3.4.2**
- **Rails 8.0.2**
- **SQLite3**
- **Importmap**（JavaScript管理）
- **Turbo / Stimulus**（Hotwire）
- **Kaminari**（ページネーション）
- **BCrypt**（パスワードハッシュ）
- **Redcarpet**（Markdownパーサー）
- **Minitest**（デフォルトテスト）

---

## 🖥️ セットアップ

```bash
# 1. リポジトリをクローン
git clone https://github.com/your-username/conduit_app.git
cd conduit_app

# 2. 依存関係をインストール
bundle install

# 3. データベースをセットアップ
bin/rails db:create db:migrate db:seed

# 4. サーバー起動
bin/rails server
```

## 👤 ユーザー機能

- `/signup` … ユーザー登録
- `/signin` … ログイン
- `/signout` … ログアウト

※ ユーザー登録時には `name` を追加入力（表示名として使用）

---

## 📝 記事機能

- トップページ（Home）に最新記事を新しい順で5件表示
- 「次へ」ボタンで次ページへ遷移（Kaminari利用）
- 記事の作成・編集・削除はログインユーザーのみ可能
- 記事詳細ページで著者の名前・タグ・本文（Markdown）が表示
