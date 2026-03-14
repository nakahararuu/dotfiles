---
name: dotfiles-apply
description: Apply chezmoi dotfile changes to the home directory and reload the affected tool. Use this whenever you have edited a config file in this chezmoi-managed dotfiles repo and the changes need to be reflected on the system. Always trigger this after editing any file under private_dot_config/, Brewfiles, or other managed config files — even if the user doesn't explicitly ask to apply. Handles `chezmoi apply` plus tool-specific reload for AeroSpace, tmux, and fish.
---

# dotfiles-apply

Editing a file in this chezmoi repo only changes the source. To actually apply changes, two steps are needed:
1. `chezmoi apply` — syncs source to the home directory
2. A tool-specific reload command — tells the running process to re-read its config

## Steps

1. Run `chezmoi apply`
2. Determine which tool's config was edited from context
3. Run the reload command for that tool (see table below)

## Tool reload commands

| Tool | Config path | Reload command |
|------|------------|----------------|
| AeroSpace | `private_dot_config/aerospace/aerospace.toml` | `aerospace reload-config` |
| tmux | `private_dot_config/tmux/` | `tmux source ~/.config/tmux/tmux.conf` (only if tmux is running) |
| fish | `private_dot_config/private_fish/` | `source ~/.config/fish/config.fish` |
| Other | anything else | (none — `chezmoi apply` is sufficient) |

For tools not in this list (git, Neovim, Alacritty, ripgrep, etc.), changes take effect automatically on next launch — no reload needed.
