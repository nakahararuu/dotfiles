---
description: Brewfile (bizBrewfile / privateBrewfile) を編集するときに適用するルール
globs:
  - "*Brewfile"
---

# Brewfile における Tap と Formula の扱い

## 背景

`brew bundle` には tap と formula の処理順序に問題がある。
`tap` ディレクティブを Brewfile の先頭に書いても、`brew bundle install` は
tap の追加より先に formula のインストールを試みるため、fresh install で失敗する。

## 方針: 完全修飾名 + 明示的 tap の併記

**両方書く**ことで install と cleanup の両方の問題を解決する:

1. `brew`/`cask` は完全修飾名を使う → fresh install が確実に動く
2. 対応する `tap` も明示的に宣言する → `brew bundle cleanup` がtapを「不要」と判断しない

```ruby
# Good — 完全修飾名と tap 宣言を両方書く
tap "felixkratz/formulae"
brew "felixkratz/formulae/borders"

tap "nikitabobko/tap"
cask "nikitabobko/tap/aerospace"
```

```ruby
# Bad — tap だけ宣言して bare name を使う（brew bundle install が失敗する）
tap "felixkratz/formulae"
brew "borders"

# Bad — 完全修飾名のみ（brew bundle cleanup が tap を untap しようとして失敗する）
brew "felixkratz/formulae/borders"
cask "nikitabobko/tap/aerospace"
```
