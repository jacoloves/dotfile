# CLAUDE.md - dotfileリポジトリ総合ガイド

> **最終更新日:** 2026-06-07 | **バージョン:** 2.0.0

---

## 📖 リポジトリ概要

このリポジトリは **Shotaro の個人用 dotfiles** を管理するものです。
ポリグロット開発者（複数言語使用）向けに最適化された、エディタ・シェル・インフラ・開発ツールの設定を一元管理します。

### 主な特徴

- **マルチエディタ対応**: Neovim（主）、Vim（従）、Emacs（従）
- **インフラ/DevOps 重視**: Terraform・Kubernetes・AWS 統合
- **多言語サポート**: Rust・Go・TypeScript・Python・Haskell・Scala など 10 言語以上
- **TDD 重視**: テスト駆動開発を全プロジェクトで徹底
- **AI 支援開発**: GitHub Copilot + Claude Code 統合済み
- **日本語優先**: コメント・ドキュメント・コミュニケーションはすべて日本語

---

## 📁 ディレクトリ構成

```
dotfile/
├── .claude/                    # Claude Code カスタム設定
│   ├── CLAUDE.md               # 詳細な開発ガイドライン（Shotaro 固有）
│   └── commands/               # カスタムスキル定義
│       ├── digger.md           # コード解析スキル
│       └── plugin-setup.md     # プラグイン設定スキル
├── .config/                    # XDG_CONFIG_HOME 相当
│   ├── nvim/                   # Neovim 設定（LazyVim ベース）
│   │   ├── init.lua            # エントリポイント
│   │   └── lua/
│   │       ├── config/         # オプション・キーマップ・自動コマンド
│   │       └── plugins/        # プラグイン個別設定
│   ├── ghostty/config          # Ghostty ターミナル設定
│   ├── wezterm.lua             # WezTerm ターミナル設定
│   ├── starship.toml           # Starship プロンプト設定
│   └── fish/                   # Fish シェル設定
├── .emacs.d/init.el            # Emacs 設定（Leaf フレームワーク）
├── .scripts/                   # ユーティリティシェルスクリプト
│   ├── ide_setting.sh          # Tmux IDE レイアウト構成
│   ├── setup.sh                # vim-plug インストール
│   ├── desktop-cleaner.sh      # デスクトップ整理
│   └── download-cleanup.sh     # Downloads フォルダ整理・アーカイブ
├── my_tools/                   # 個人用ユーティリティスクリプト
├── etc/                        # 追加設定ファイル
├── .gitconfig                  # Git 設定（エイリアス・色設定・git-secrets）
├── .tmux.conf                  # Tmux 設定（C-q プレフィックス・vim キーバインド）
├── .vimrc                      # Vim 設定（Vundle プラグインマネージャー）
├── .zshrc                      # Zsh 設定（zplug・Starship・エイリアス）
├── Brewfile                    # Homebrew パッケージ・App マニフェスト
├── dein.toml                   # Dein.vim プラグイン設定（TOML）
├── init.vim                    # Neovim レガシー設定（vim-plug ベース）
├── _vimrc                      # Windows 用 Vim 設定
└── init.cmd                    # Windows コマンドプロンプト初期化
```

---

## 🛠️ ツールスタック

### エディタ

| ツール | 役割 | プラグインマネージャー |
|--------|------|----------------------|
| **Neovim** | 主要エディタ | Lazy.nvim + LazyVim |
| **Vim** | 従来サポート | Vundle / Dein.vim |
| **Emacs** | サブエディタ | Leaf |

### シェル・ターミナル

| ツール | 役割 |
|--------|------|
| **Zsh** | 主要シェル（zplug・Starship）|
| **Fish** | サブシェル |
| **Tmux** | ターミナルマルチプレクサ |
| **Ghostty** | 主要ターミナルエミュレータ |
| **WezTerm** | 代替ターミナルエミュレータ |

### インフラ・クラウド

| ツール | 役割 |
|--------|------|
| **Terraform** | Infrastructure as Code |
| **Kubernetes** | コンテナオーケストレーション（kubectl・kubectx・k9s・eksctl）|
| **Docker** | コンテナ化 |
| **AWS CLI** | クラウドインフラ管理（SSO・Systems Manager）|

---

## 🔤 対応プログラミング言語

| 言語 | LSP | フォーマッタ | 備考 |
|------|-----|------------|------|
| **Rust** | rust-analyzer | rustfmt | crates.nvim で依存管理 |
| **Go** | gopls | gofumpt / goimports | 自動インポート |
| **TypeScript/JS** | vtsls | prettier | Node.js スニペット |
| **Python** | pyright | Ruff | 静的型チェック + リント |
| **Haskell** | hls | ormolu | 関数型プログラミング |
| **Scala** | Metals | scalafmt | |
| **C/C++** | clangd | ClangFormat | |
| **Terraform** | terraform-ls | terraform fmt | |
| **YAML/JSON** | yaml-language-server | prettier | |
| **Markdown** | markdownlint | | Treesitter パーサー |

---

## ⌨️ キーバインド・エイリアス早見表

### Zsh / Fish エイリアス

```sh
lg        # lazygit（Git TUI）
v         # nvim（Neovim）
k         # kubectl
tf        # terraform
E         # emacsclient（ターミナルから Emacs）
ssodev    # AWS SSO ログイン（開発環境）
ssoprod   # AWS SSO ログイン（本番環境）
devssm    # AWS Systems Manager セッション（開発）
prossm    # AWS Systems Manager セッション（本番）
```

### Tmux キーバインド

| キー | 操作 |
|------|------|
| `C-q` | プレフィックス（デフォルト `C-b` から変更）|
| `\|` | 垂直分割 |
| `-` | 水平分割 |
| `h/j/k/l` | ペイン移動（vim スタイル）|
| `H/J/K/L` | ペインリサイズ（vim スタイル）|
| `C-p` | コピーモードでペースト |

### Neovim キーバインド（主要）

| キー | 操作 |
|------|------|
| `<leader>ac` | Claude Code トグル |
| `<leader>aa` | diff 受け入れ |
| `<C-s>` | ファイル保存 |
| `<C-n>` | NERDTree トグル |

### Git エイリアス（.gitconfig）

```sh
git s      # git status
git l      # ログ（カスタムフォーマット）
git d      # git difftool（Difftastic）
git co     # git checkout
git br     # git branch
```

---

## 🔒 セキュリティ設定

- **git-secrets** を有効化 → AWS 認証情報の誤コミットを防止
- **IAM 最小権限原則** を徹底
- シークレット管理: AWS Secrets Manager / 環境変数 / sops / Vault から選択

---

## 📐 コーディング規約

### コメント・ドキュメント

- **すべてのコメント・ドキュメントは日本語で記述**
- すべての関数・モジュール・複雑なロジックに説明コメントを付与
- README・外部ドキュメントも日本語

### エラーハンドリング

| 言語 | アプローチ |
|------|-----------|
| Rust | `Result` 型を積極活用、`panic!` は避ける |
| Go | `error` を明示的に返す、エラーラッピング活用 |
| Python | カスタム例外クラスを適切に使用 |

エラーメッセージには以下を含める:
1. 何が起きたか
2. なぜ起きたか
3. どう対処するか

### コードレビュー優先順位

1. **保守性** - 将来的に変更・拡張しやすいか
2. **可読性** - 他の開発者が理解しやすいか
3. **セキュリティ** - 脆弱性がないか
4. **パフォーマンス** - 必要な場合のみ最適化

---

## 🔄 開発ワークフロー

### TDD サイクル（必須）

```
1. Red   → 失敗するテストを先に書く
2. Green → テストを通す最小限の実装
3. Refactor → SOLID 原則・可読性・保守性を高める
```

### 新機能開発フロー

```
1. 要件整理
   ↓
2. テスト設計（Red フェーズ）
   ↓
3. 最小実装（Green フェーズ）
   ↓
4. リファクタリング（Refactor フェーズ）
   ↓
5. インテグレーション確認
```

### Tmux IDE レイアウト

`.scripts/ide_setting.sh` を使用して以下のレイアウトを自動構成:

```
┌─────────────────┬──────────┐
│                 │  Shell   │
│  エディタ (Nvim) ├──────────┤
│                 │  Git/Log │
└─────────────────┴──────────┘
```

---

## 📦 パッケージ管理

### Homebrew（macOS）

```sh
brew bundle install    # Brewfile からすべてのパッケージをインストール
brew bundle dump       # 現在の環境を Brewfile に書き出す
```

### Neovim プラグイン（Lazy.nvim）

```sh
:Lazy sync    # プラグインの同期
:Lazy update  # プラグインの更新
:Mason        # LSP/ツールインストーラー
```

### Vim プラグイン（Vundle）

```sh
:PluginInstall    # プラグインインストール
:PluginUpdate     # プラグイン更新
:PluginClean      # 未使用プラグイン削除
```

---

## 🤖 AI 支援開発（Claude Code + Copilot）

### Claude Code 設定（`.claude/`）

- **設定ファイル**: `.claude/CLAUDE.md` → 詳細な開発ガイドライン
- **カスタムスキル**: `.claude/commands/` → `digger`・`plugin-setup`
- **Neovim 統合**: `<leader>ac` で Claude Code パネルをトグル

### 重要ルール（コード変更前に必読）

1. **明示的な許可なくソースコードを変更しない**
2. 変更提案前に以下を説明する:
   - なぜそのアーキテクチャを選択したか
   - 他のアーキテクチャオプションは何か
   - トレードオフ比較表
3. コード提示後は **「Apply the source code」** の指示を待つ

---

## ✅ 品質ゲート

コード完成前に必ず確認:

- [ ] すべてのテストがパスし、エッジケースをカバーしている
- [ ] 既存のパターン・規約に準拠している
- [ ] ビジネスロジックとトレードオフがドキュメント化されている
- [ ] パフォーマンスへの影響が把握されている
- [ ] セキュリティ要件が満たされている
- [ ] インテグレーションポイントが明確に定義されている
- [ ] コメント・ドキュメントが日本語で記述されている

---

## 🚫 してはいけないこと

| 禁止事項 | 理由 |
|---------|------|
| 許可なくソースコードを変更する | Shotaro の設計思想を尊重するため |
| 依存関係を勝手に追加する | 互換性・セキュリティリスクのため |
| 既存の規約を無視する | 一貫性維持のため |
| セキュリティ要件を軽視する | インフラ設定は本番環境に直結するため |
| 英語でコメント・ドキュメントを書く | 日本語統一のため |

---

## 📝 コミットメッセージ規約

```
feat:     新機能追加
fix:      バグ修正
chore:    ビルド・設定変更
docs:     ドキュメント更新
refactor: コードリファクタリング
test:     テスト追加・修正
```

**例:**
```
feat: neovim に ClaudeCode.nvim を追加
fix: zshrc の AWS SSO ログインエイリアスを修正
chore: Brewfile に新ツールを追加
```

---

*このファイルはリポジトリの状態に応じて随時更新してください。*
