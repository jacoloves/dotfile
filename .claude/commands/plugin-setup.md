# digのpluginの追加方法

## 概要

[fumiya-kume/claude-code](https://github.com/fumiya-kume/claude-code/tree/master/dig) で公開されている `dig` プラグインをClaude Codeに追加する方法を説明します。

## GitHubの`dig`コマンドの構造

```
dig/
├── .claude-plugin/
│   └── plugin.json
├── commands/
│   └── dig.md      ← スラッシュコマンドの本体
└── README.md
```

## スラッシュコマンドの追加方法

Claude Codeのスラッシュコマンドは、**Markdownファイルを特定のディレクトリに配置するだけ**で追加できます。

| 配置場所 | 適用範囲 | `/help`での表示 |
|----------|----------|-----------------|
| `~/.claude/commands/` | 全プロジェクト共通（個人用） | `(user)` |
| `.claude/commands/` | 現在のプロジェクトのみ | `(project)` |

## 具体的な手順

### 1. GitHubから`dig.md`の内容を取得

```bash
curl -o ~/.claude/commands/dig.md \
  https://raw.githubusercontent.com/fumiya-kume/claude-code/master/dig/commands/dig.md
```

### 2. 確認

追加後、Claude Codeで `/help` を実行すると、`/dig (user)` として表示されます。

## 補足

- ファイル名がそのままコマンド名になります（`dig.md` → `/dig`）
- 同名のコマンドがプロジェクトとグローバルに存在する場合、**プロジェクト版が優先**されます
- YAMLフロントマターで以下のメタデータを指定できます：
  - `description`: コマンドの説明
  - `allowed-tools`: 使用可能なツール
  - `argument-hint`: 引数のヒント

## digプラグインの機能

- **コンテキスト自動読み込み**: CLAUDE.md、prd.md、README.mdなどのプロジェクトファイルから自動的に情報を取得
- **曖昧性の識別**: アーキテクチャ、データ、API、UI/UX、テスト、DevOps、スコープなど複数のカテゴリから問題を抽出
- **構造化質問の生成**: 具体的な選択肢とそれぞれの長所・短所を含む2〜4つの質問を提供
- **決定事項の出力**: ユーザーの回答後に決定内容と次のステップを要約

## 参考リンク

- [fumiya-kume/claude-code - GitHub](https://github.com/fumiya-kume/claude-code/tree/master/dig)
