# aws_terraform ツール

`aws_terraform` は、Terraform 用のテンプレートフォルダとファイルをコマンドで自動作成する CLI ツールです。

## できること

- `env/<name>` や `module/<name>` のフォルダを作成
- テンプレートの `.tf` ファイルを自動作成

## 前提

- Zig がインストールされていること

## ビルド

`tool` ディレクトリで実行します。

```bash
zig build
```

ビルド後の実行ファイル:

- `tool/zig-out/bin/aws_terraform`（最新ビルド出力）
- `tool/bin/aws_terraform`（運用用コピー）

## 使い方

```bash
aws_terraform [-C 作成先フォルダ] <parent_name> <child_name>
```

### 引数

- `<parent_name>`: `env` または `module`
- `<child_name>`: 作成する子フォルダ名（例: `dev`, `prod`, `vpc`）
- `-C 作成先フォルダ`: 作成先を明示指定（省略可）

### デフォルト作成先

`-C` を省略した場合、**実行ファイル配置先（`tool/bin`）の1つ上のフォルダ**を作成先として使用します。  
つまり通常は `aws_terraform` リポジトリ直下に作成されます。

## 実行例

### 1) デフォルト作成先（推奨）

```bash
aws_terraform env dev
```

作成先イメージ:

```text
aws_terraform/
  env/
    dev/
      backend.tf
      locals.tf
      main.tf
      outputs.tf
      providers.tf
      terraform.tf
      variables.tf
```

### 2) 作成先を明示指定

```bash
aws_terraform -C /path/to/project module vpc
```

## どこからでも実行する設定（任意）

`~/.zshrc` に `tool/bin` を追加すると、任意ディレクトリから実行できます。

```bash
export PATH="$PATH:/Users/endouikki/Output/aws_terraform/tool/bin"
```

反映:

```bash
source ~/.zshrc
```

## 補足

- 既存フォルダがあっても作成処理は継続します。
- 同名ファイルが既に存在する場合はエラーになるため、必要に応じてファイル名や運用を調整してください。
