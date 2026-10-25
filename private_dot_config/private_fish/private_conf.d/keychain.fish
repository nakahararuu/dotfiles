## SSHログイン時はログインキーチェーンがロックされたままなので解除する
## (show-keychain-info はロック中だと失敗するので、そのときだけパスワードを聞く)
if status is-interactive; and set -q SSH_CONNECTION; and command -q security
    set -l keychain ~/Library/Keychains/login.keychain-db
    if not security show-keychain-info $keychain &>/dev/null
        security -v unlock-keychain $keychain
    end
end
