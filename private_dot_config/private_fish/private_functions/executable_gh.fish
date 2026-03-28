function gh -d "run GitHub CLI without GITHUB_TOKEN"
    env -u GITHUB_TOKEN command gh $argv
end
