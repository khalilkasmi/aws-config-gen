# VHS demo for aws-config-gen setup

Output demo-setup.gif

Set Shell "bash"
Set FontSize 14
Set Width 1200
Set Height 600
Set Theme "Catppuccin Mocha"
Set Padding 20
Set TypingSpeed 40ms

# Launch setup
Type "aws-config-gen setup --sso-url https://d-936705fdc9.awsapps.com/start --dry-run"
Enter
Sleep 8s

# Browser auth happens — wait for accounts and roles to load
Sleep 20s

# fzf TUI appears — filter
Type "prod"
Sleep 2s

# Clear and select all
Backspace 4
Sleep 0.5s

# Select a few with TAB
Tab
Sleep 0.5s
Down
Tab
Sleep 0.5s
Down
Tab
Sleep 0.5s
Down
Down
Tab
Sleep 1s

# Confirm selection
Enter
Sleep 4s
