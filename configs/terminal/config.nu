# environment configuration
$env.config.show_banner = false
$env.PROMPT_COMMAND_RIGHT = ""

# find -> fd
def --wrapped find [...args] {
    if ($in | is-not-empty) {
        builtin find ...$args
    } else {
        fd ...$args
    }
}

# ls -> eza
def --wrapped ls [...args] {
    eza ...$args
}

# Aliases
alias cat = bat --style=plain
alias grep = rg
