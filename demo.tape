# VHS demo for aws-config-gen

Output demo.gif

Set Shell "bash"
Set FontSize 14
Set Width 1200
Set Height 600
Set Theme "Catppuccin Mocha"
Set Padding 20
Set TypingSpeed 40ms

# Show help
Type "aws-config-gen --help"
Enter
Sleep 4s

# Show login help
Type "aws-config-gen login --help"
Enter
Sleep 3s

# Launch login TUI
Type "aws-config-gen login"
Enter
Sleep 2s

# Filter in fzf
Type "prod"
Sleep 2s

# Clear and try another
Backspace 4
Sleep 0.5s

Type "admin"
Sleep 2s

# Navigate down
Down
Sleep 0.5s
Down
Sleep 0.5s
Up
Sleep 1s

# Select and login
Enter
Sleep 3s
