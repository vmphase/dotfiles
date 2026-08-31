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

# load env
def --env dotenv [] {
    let pairs = (open .env
        | lines
        | where ($it | str trim | str length) > 0
        | where not ($it | str trim | str starts-with '#')
        | parse "{k}={v}"
        | update k { str trim }
        | update v { str trim })

    mut resolved = {}
    for pair in $pairs {
        mut val = $pair.v
        for key in ($resolved | columns) {
            let pattern = (["${" $key "}"] | str join)
            if ($val | str contains $pattern) {
                $val = ($val | str replace -a $pattern ($resolved | get $key))
            }
        }
        $resolved = ($resolved | insert $pair.k $val)
    }

    load-env $resolved
}

# Aliases
alias cat = bat --style=plain
alias grep = rg
