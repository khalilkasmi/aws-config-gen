# aws-config-gen

Interactive TUI tool to discover and generate `~/.aws/config` profiles from AWS SSO, and to switch between them.

Authenticates via SSO, fetches all accounts/roles you have access to, and lets you pick which ones to add using a fuzzy-searchable selector. A separate `login` subcommand browses existing profiles, runs `aws sso login`, and exports `AWS_PROFILE` into your shell.

## Install

```bash
brew tap khalilkasmi/tools
brew install aws-config-gen
```

## Quick start

```bash
# 1. Generate config (interactive TUI)
aws-config-gen setup --sso-url https://myorg.awsapps.com/start

# 2. Login + set AWS_PROFILE in current shell
eval "$(aws-config-gen login)"

# 3. Use the AWS CLI normally
aws s3 ls
```

> The `eval` wrapper is required for `AWS_PROFILE` to land in your shell — a subprocess cannot mutate its parent's environment. Running `aws-config-gen login` on its own still logs you in and prints the `export` line to stdout; you just have to source it yourself.
>
> Optional shell alias:
> ```bash
> alias awslogin='eval "$(aws-config-gen login)"'
> ```

## `setup` — generate config

```bash
# Interactive — opens TUI to pick profiles
aws-config-gen setup --sso-url https://myorg.awsapps.com/start

# With SSO session (shared auth across profiles)
aws-config-gen setup --sso-url https://myorg.awsapps.com/start --sso-session myorg

# Pre-filter to only show "prod" accounts
aws-config-gen setup --sso-url https://myorg.awsapps.com/start --filter prod

# Skip TUI, grab everything
aws-config-gen setup --sso-url https://myorg.awsapps.com/start --select-all

# Custom profile naming (default: {name}-{role})
aws-config-gen setup --sso-url https://myorg.awsapps.com/start --profile-format "{account}-{role}"

# Preview without writing
aws-config-gen setup --sso-url https://myorg.awsapps.com/start --dry-run

# Fresh config (backs up existing first)
aws-config-gen setup --sso-url https://myorg.awsapps.com/start --new
```

## `login` — switch profiles

```bash
eval "$(aws-config-gen login)"
```

Opens a fuzzy picker of profiles from `~/.aws/config`, runs `aws sso login --profile <selected>`, then prints `export AWS_PROFILE=<selected>` on stdout so the surrounding `eval` exports it.

Running `aws-config-gen` with no subcommand defaults to `login` if profiles already exist.

## TUI Controls

| Key | Action |
|---|---|
| Type | Filter/search |
| TAB | Toggle selection (multi-select in `setup`) |
| Ctrl-A | Select all |
| Ctrl-D | Deselect all |
| ENTER | Confirm |

## `setup` options

| Flag | Description | Default |
|---|---|---|
| `--sso-url` | SSO start URL (required) | — |
| `--region` | Default region for profiles | `eu-west-1` |
| `--sso-region` | SSO region | auto-detected |
| `--sso-session` | SSO session name | — |
| `--output` | Output format (json/yaml/text) | `json` |
| `--profile-format` | Naming template: `{name}`, `{account}`, `{role}`, `{email}` | `{name}-{role}` |
| `--filter` | Pre-filter accounts before TUI | — |
| `--select-all` | Skip TUI, select everything | — |
| `--new` | Overwrite existing config (backs up first) | append |
| `--dry-run` | Print to stdout only | — |

## License

MIT
