set -gx XDG_CURRENT_DESKTOP sway
set -gx XDG_SESSION_TYPE wayland
set -gx MOZ_ENABLE_WAYLAND 1

set -g fish_greeting

alias sudo doas
alias runsway 'dbus-run-session sway'
alias updateall 'doas xbps-install -Su && flatpak update'

if status is-interactive

    if test "$TERM" = "linux"
        set -g fish_color_user brgreen
        set -g fish_color_host brred
        set -g fish_color_cwd bryellow
    else
        starship init fish | source
    end

    if type -q fastfetch
        sleep 0.01
        fastfetchtty
    end

    zoxide init fish | source
end

