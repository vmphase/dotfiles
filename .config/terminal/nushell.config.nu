$env.config.show_banner = false
$env.PROMPT_COMMAND_RIGHT = ""
$env.config.history.path = null
$env.EDITOR = "nvim"
$env.config.buffer_editor = "nvim"

alias cat = bat --style=plain
alias grep = rg

def --wrapped find [...args] {
    let input = $in
    if ($input | is-not-empty) {
        $input | %find ...$args
    } else {
        ^fd ...$args
    }
}

def --wrapped ls [...args] {
    ^eza ...$args
}

def --env dotenv [file: path = .env] {
    let pairs = (
        open --raw $file
        | lines
        | each { str trim }
        | where { |l| ($l | str length) > 0 and not ($l | str starts-with '#') }
        | each { str replace -r '^export\s+' '' }
        | parse -r '^(?<k>[A-Za-z_][A-Za-z0-9_]*)\s*=\s*(?<v>.*)$'
        | update v { str trim | str trim -c '"' | str trim -c "'" }
    )

    mut resolved = {}
    for pair in $pairs {
        mut val = $pair.v
        for key in ($resolved | columns) {
            let pattern = (["${" $key "}"] | str join)
            $val = ($val | str replace -a $pattern ($resolved | get $key))
        }
        $resolved = ($resolved | upsert $pair.k $val)
    }

    load-env $resolved
}
