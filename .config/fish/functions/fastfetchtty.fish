# fastfetch for tty and normal terminal

function fastfetchtty
    if test "$TERM" = "linux"
        printf '\e]P9ff4d6d\e]PAff8fa3\e]PBe03a58\e]PCb3203a\e]PD8c1a2e\e]P8888888'
        fastfetch -c ~/.config/fastfetch/tty.jsonc $argv
    else
        fastfetch $argv
    end
end
