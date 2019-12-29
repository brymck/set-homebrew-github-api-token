#!/usr/bin/env zsh
set -e
autoload -U colors && colors

token=$HOMEBREW_GITHUB_API_TOKEN
if [[ -n $token ]]; then
    print 'Your GitHub personal access token for Homebrew is already set:'
    print "  $token"
else
    print 'Looks like you need a personal access token. Go to the following URL:'
    print "  ${fg_no_bold[cyan]}https://github.com/settings/tokens/new${reset_color}"
    print
    print "1. Give your token any name you like, such as ${bold_color}Homebrew${reset_color}"
    print "2. Check the ${bold_color}repo (Full control of private repositories)${reset_color} checkbox"
    print "3. Click ${bold_color}Generate Token${reset_color}"
    print '4. Paste your token below'
    print
    vared -p 'GitHub personal access token: ' -c token
fi
print

export_line="export HOMEBREW_GITHUB_API_TOKEN='$token'"

default_shell_path=$(dscl . -read ~/ UserShell | cut -d ' ' -f 2)

default_shell=$(basename $default_shell_path)
print "Default shell: $default_shell ($default_shell_path)"
print

case $default_shell in
    bash)
        rc=$HOME/.bash_profile
        ;;
    zsh)
        rc=$HOME/.zshrc
        ;;
    *)
        print 'Unknown shell'
        exit 1
        ;;
esac
print -n "Checking for HOMEBREW_GITHUB_API_TOKEN export in $rc... "

if grep -q -F 'export HOMEBREW_GITHUB_API_TOKEN=' $rc; then
    print 'found'
else
    print 'missing!'
    print
    print "Adding the following line to $rc:"
    print "  $export_line"
    print "$export_line" >> $rc
fi
print

print "Run the following to confirm your Homebrew GitHub API token is set properly:"
print
print "  source $rc && echo \"HOMEBREW_GITHUB_API_TOKEN: \$HOMEBREW_GITHUB_API_TOKEN\""
