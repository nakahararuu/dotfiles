---
description: Brewfile (bizBrewfile / privateBrewfile) を編集するときに適用するルール
globs:
  - "*Brewfile"
---

# Brewfile における Tap と Formula の明示的な分離

When editing either Brewfile, always declare third-party taps explicitly with a
`tap` directive and use the bare formula/cask name in `brew`/`cask` directives.
Never combine them into a fully-qualified name like `brew "user/repo/formula"`.

**Why:** `brew bundle cleanup` treats taps not listed in the Brewfile as
unnecessary and attempts to remove them. If a formula installed via an implicit
tap is still present, Homebrew refuses the untap and aborts with:
`Error: Refusing to untap <tap> because it contains the following installed formulae or casks: ...`

```ruby
# Bad — implicit tap, causes cleanup errors
brew "user/repo/my-formula"
cask "nikitabobko/tap/aerospace"

# Good — tap declared explicitly, formula/cask uses bare name
tap "user/repo"
brew "my-formula"

tap "nikitabobko/tap"
cask "aerospace"
```

This applies to direct dependencies and to taps that are added implicitly as
build dependencies — declare them all explicitly.
