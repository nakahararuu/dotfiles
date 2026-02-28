# AI.md - Chezmoiによるドットファイル管理プロジェクト

このプロジェクトは、[chezmoi](https://github.com/twpayne/chezmoi)を使用して管理されている個人用のドットファイルリポジトリです。macOS（特にCatalina/Big Sur以降）の開発環境のセットアップと同期を自動化するように設計されており、「ビジネス（biz）」と「プライベート（private）」の両方のマシン構成をサポートしています。

## プロジェクト概要

*   **管理ツール:** `chezmoi`
*   **対象OS:** macOS (Catalina/Big Sur 以降に最適化)
*   **シェル:** fish shell (`fisher` プラグインマネージャーを使用)
*   **パッケージ管理:** Homebrew (`bizBrewfile` または `privateBrewfile`)
*   **バージョン管理:** `asdf` (Node.js, Java, Python, Go 等)
*   **ウィンドウ管理:** `yabai` (タイル型ウィンドウマネージャー) と `skhd` (ホットキーデーモン)
*   **ターミナル:** `alacritty` + `tmux`
*   **エディタ:** Neovim および IntelliJ IDEA

## 主要なディレクトリとファイル

*   `.chezmoi.toml.tmpl`: `chezmoi` 設定のテンプレート。初期化時に `machineType` (biz/private) や Git の認証情報を入力します。
*   `.chezmoiscripts/`: `chezmoi apply` 時に実行されるスクリプト群:
    *   `run_once_before_install-packages.sh.tmpl`: マシンタイプに基づいた Homebrew パッケージのインストール。
    *   `run_once_after_install-plugins.sh`: `asdf` プラグインのセットアップ、各言語ランタイムのインストール、`fisher` の設定。
    *   `run_enable_macos_key_repeat.sh` & `run_disable_macos_man_page_shortcuts.sh`: macOS のシステム標準設定の構成。
*   `bizBrewfile` & `privateBrewfile`: Homebrew Bundle ファイル（CLIツール、GUIアプリ、フォント等）。
*   `private_dot_config/`: 以下の設定ファイル群を含みます:
    *   `alacritty`, `asdf`, `borders`, `direnv`, `git`, `ideavim`, `nvim`, `fish`, `karabiner`, `ripgrep`, `skhd`, `tmux`, `yabai`
*   `ghq/`: 組織やユーザーごとに異なる Git 設定を適用するためのテンプレート。

## 使用方法とコマンド

### 新規マシンのセットアップ（ブートストラップ）

ホームディレクトリで以下のコマンドを実行します：

```bash
chezmoi init --apply --verbose https://github.com/nakahararuu/dotfiles.git
```

初期化中に `machineType` (`biz` または `private`) の選択と、Git 設定情報の入力を求められます。

### 設定の適用

最新の変更をソースディレクトリからホームディレクトリに同期する場合：

```bash
chezmoi apply
```

### 新しい設定の追加

新しい設定ファイルを `chezmoi` の管理下に追加する場合：

```bash
chezmoi add ~/.config/new_tool/config
```

## 開発規約

*   **テンプレート:** `.tmpl` で終わるファイルは `chezmoi` のテンプレートエンジンを使用します。共通変数は `.chezmoi.toml.tmpl` で定義されています。
*   **非公開ファイル:** `private_` プレフィックスが付いたファイルは、制限された権限（パーミッション）で作成されます。
*   **スクリプト:** `.chezmoiscripts/` 内のスクリプトは可能な限り冪等（何回実行しても結果が変わらない）であるべきです。初めて実行する場合や内容が変わった場合のみ実行したい場合は `run_once_` プレフィックスを使用します。
*   **Brewfiles:** システムレベルの依存関係を追加した場合は、必ず対応する `Brewfile` を更新してください。
