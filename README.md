# dotfiles
my dotfiles for macos[catalina, big sur]

# requirement
- [chezmoi](https://github.com/twpayne/chezmoi)
- Homebrew

# install
specify your git accounts
```
mkdir -p ~/.config/chezmoi
cat << EOF > ~/.config/chezmoi/chezmoi.toml
[data.biz.git]
organization = 'hogehoge-inc'
user = 'hoge'
email = 'hoge@biz.co.jp'
signingkey = 'hogehoge'

[data.private.git]
user = 'fuga'
email = 'fuga@gmail.com'
EOF
```

exec following command on your home directory
```
chezmoi init --apply --verbose https://github.com/nakahararuu/dotfiles.git
```
