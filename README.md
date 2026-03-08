# aws-config-gen

Interactive TUI tool for AWS SSO config management. Discover accounts/roles, generate `~/.aws/config`, and login to profiles — all with fuzzy search.

## Install

```bash
brew tap khalilkasmi/tools
brew install aws-config-gen
```

## Demo

### Login — browse and login to any profile instantly

![login demo](https://vhs.charm.sh/vhs-73U5Llr6VdjWcJWf8MIg8O.gif)

### Setup — discover all SSO accounts/roles and generate config

![setup demo](https://vhs.charm.sh/vhs-6HUvcyy78HhBRzDmlIEKku.gif)

## Usage

### Login

```bash
aws-config-gen login    # fuzzy-search profiles, select, login
aws-config-gen          # same thing (defaults to login if profiles exist)
```

### Setup

```bash
# Interactive — discover accounts/roles and pick which to add
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

## TUI Controls

| Key | Action |
|---|---|
| Type | Filter/search |
| TAB | Toggle selection |
| Ctrl-A | Select all |
| Ctrl-D | Deselect all |
| ENTER | Confirm |

## Setup Options

| Flag | Description | Default |
|---|---|---|
| `--sso-url` | SSO start URL (required) | — |
| `--region` | Default region for profiles | `eu-west-1` |
| `--sso-region` | SSO region (auto-detected) | auto |
| `--sso-session` | SSO session name | — |
| `--output` | Output format (json/yaml/text) | `json` |
| `--profile-format` | Naming template: `{name}`, `{account}`, `{role}`, `{email}` | `{name}-{role}` |
| `--filter` | Pre-filter accounts before TUI | — |
| `--select-all` | Skip TUI, select everything | — |
| `--new` | Overwrite existing config (backs up first) | append |
| `--dry-run` | Print to stdout only | — |

## License

MIT
