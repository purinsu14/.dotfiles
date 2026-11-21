# rainysushixx's .dotfiles

Void Linux with wayland.
Including sway, waybar, foot, fish, nvim, etc.
Managed with [Stow](https://www.gnu.org/software/stow/).

## What's inside

| Dir | What it is |
|---|---|
| `sway` | my wm |
| `waybar` | wm status bar (with scripts and css) |
| `foot` | terminal (wayland native btw) |
| `fish` | my fav shell |
| `nvim` | i use nvim btw (kickstart-based, `vim.pack`) |
| `yazi` | file manager |
| `tofi` | app launcher |
| `swaylock` | lock screen |
| `btop` | system monitor |
| `fastfetch` | system info (with custom ASCII art ofc) |
| `gtk-3.0` | GTK settings |
| `pipewire` | audio drop-ins (using symlinks to system examples) |
| `xdg-desktop-portal*` | portals, incl. termfilechooser (yazi as file picker) |
| `yt-dlp` | yt-dlp config |
| `mimeapps.list` | my default applications |

## Install

```sh
# 1. install the packages you need (sway, waybar, foot, fish, nvim, etc.)
# from your favorite package manager. XBPS for me.

# 2. make sure ~/.config exists
mkdir -p ~/.config

# 3. clone and stow
git clone <repo-url> ~/.dotfiles
cd ~/.dotfiles
stow .
```

If stow reports conflicts, the machine already has real files at those paths. (~/.config/...)
Move or delete them and run `stow .` again.

## Notes

- `pipewire/pipewire.conf.d/*` are absolute symlinks to `/usr/share/examples/...`.
  They only work if `pipewire` and `wireplumber` are installed on the machine.
- Plugins for Neovim are installed by `vim.pack` into `~/.local/share/nvim`,
  not tracked here. Only `nvim-pack-lock.json` is.

## Updating (FOR ME)

Edit from `~/.config`, stow symlinks into this repo, then

```sh
cd ~/.dotfiles
git add -u
git commit -m "tweak stuff"
git push
```

Then to update from other machine, do: `git pull`. New apps need `stow -R .` afterwards.
