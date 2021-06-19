# dotfiles
my dotfiles for macos[catalina, big sur]

# requirement
- bash
- curl
- git
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

[data.private.git]
user = 'fuga'
email = 'fuga@gmail.com'
EOF
```

exec following command on your home directory
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/nakahararuu/dotfiles/master/bootstrap.sh)"
```
