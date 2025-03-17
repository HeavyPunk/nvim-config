## Requirements
- Neovim ^0.10
- curl
- gcc (for native pkg compilation)
### C# dev:
- Dotnet SDK 8
### JS/TS dev:
- NodeJs ^20
### Rust dev:
- rustup
- cargo
- cargo-nextest (if you wanna run tests in rust)

## Installation
- Clone content of this repository to `$HOME/.config/nvim`
- Open Neovim
- Package manager (Lazy) will starts installation of packages, just wait
- Run vim command `:Mason` and install:
    - csharp_ls (C# dev)
    - netcoredbg (C# dev)
    - typescript-language-server (JS/TS dev)
    
- Restart Neovim after package installation finish (it needs to prevent any bugs)
- Open your project and have fun
