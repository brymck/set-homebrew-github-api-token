set-homebrew-github-api-token
=============================

This repo just provides a simple way of directing a non-technical user at the macOS command line to set up a GitHub API token and export it properly in their default shell's configuration file.

This environment variable is used by custom Homebrew strategies for reading from private repos.
Read this blog post for more on how to set up a such a tap:

http://lessthanhero.io/post/homebrew-with-private-repo-releases/

Usage
-----

Copy and paste this into a terminal and follow the instructions:

```zsh
curl -sL https://raw.githubusercontent.com/brymck/set-homebrew-github-api-token/master/set-homebrew-github-api-token.zsh | zsh
```
