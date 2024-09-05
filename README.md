**This config based on NvChad starter**

# OS dependencies

- gdb (for debug C/C++/Rust)
- dotnet sdk 8.0 (for C# LSP-server)
- netcoredbg (for debug dotnet apps)
- ripgrep (for fuzzy search)

To install netcoredbg you should download latest release from [github](https://github.com/Samsung/netcoredbg/releases). Then unzip archive to /usr/local/bin/netcoredbg/ folder and run `chmod 774 /usr/local/bin/netcoredbg/*` to folow execution by your user.

# Installation

Neovim configures automaticaly, but you should run some commands manualy:
Run vim commands inside of neovim:
``` vim
:MasonInstallAll
:Mason install csharp-language-server
:Mason install rust-analyzer
```

