# ZSH

Configure `zsh` for all users. This role uses the powerline theme from https://github.com/bhilburn/powerlevel9k, since that is one of the most lightweight approaches that I could find. The main theme get's installed to /etc/zsh and each new user per default sources it because we put a default zshrc in `/etc/skel`. Root additionally get's a zshrc directly if it didn't exist previously.
