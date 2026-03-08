# aws-config-gen

Interactive TUI tool to discover and generate `~/.aws/config` profiles from AWS SSO.

Authenticates via SSO, fetches all accounts/roles you have access to, and lets you pick which ones to add using a fuzzy-searchable selector.

## Install

```bash
brew tap khalilkasmi/tools
brew install aws-config-gen
```

## Usage

```bash
# Interactive — opens TUI to pick profiles
aws-config-gen --sso-url https://myorg.awsapps.com/start

# With SSO session (shared auth across profiles)
aws-config-gen --sso-url https://myorg.awsapps.com/start --sso-session myorg

# Pre-filter to only show "prod" accounts
aws-config-gen --sso-url https://myorg.awsapps.com/start --filter prod

# Skip TUI, grab everything
aws-config-gen --sso-url https://myorg.awsapps.com/start --select-all

# Custom profile naming (default: {name}-{role})
aws-config-gen --sso-url https://myorg.awsapps.com/start --profile-format "{account}-{role}"

# Preview without writing
aws-config-gen --sso-url https://myorg.awsapps.com/start --dry-run

# Fresh config (backs up existing first)
aws-config-gen --sso-url https://myorg.awsapps.com/start --new
```

## TUI Controls

| Key | Action |
|---|---|
| Type | Filter/search |
| TAB | Toggle selection |
| Ctrl-A | Select all |
| Ctrl-D | Deselect all |
| ENTER | Confirm |

## Options

| Flag | Description | Default |
|---|---|---|
| `--sso-url` | SSO start URL (required) | — |
| `--region` | Default region for profiles | `eu-west-1` |
| `--sso-region` | SSO region | same as `--region` |
| `--sso-session` | SSO session name | — |
| `--output` | Output format (json/yaml/text) | `json` |
| `--profile-format` | Naming template: `{name}`, `{account}`, `{role}`, `{email}` | `{name}-{role}` |
| `--filter` | Pre-filter accounts before TUI | — |
| `--select-all` | Skip TUI, select everything | — |
| `--new` | Overwrite existing config (backs up first) | append |
| `--dry-run` | Print to stdout only | — |

## License

MIT
