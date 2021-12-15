# Basic setup


Install tpm


```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
~/.tmux/plugins/tpm/bin/install_plugins
```

# Arch configuration for niceness


1. Install libvirtd to run efficient virutal machines.
2. Install avahi-daemon to resolve dns names for the virtual machines - requires enabling on the interface for libvirtd network bridge
3. Use `Host *.local \n ForwardAgent yes` in `.ssh/config` to forward your ssh key agent to all the VMs you ssh into



