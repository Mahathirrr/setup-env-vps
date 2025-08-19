# Setup Development Environment untuk VPS Ubuntu

Guide ini akan membantu Anda setup environment development minimal di VPS Ubuntu dengan fokus pada JavaScript, TypeScript, React, Vue.js, Go, dan Node.js.

## Prerequisites

Pastikan VPS Ubuntu Anda sudah terupdate:

```bash
sudo apt update && sudo apt upgrade -y
```

## 1. Install Dependencies Dasar

```bash
# Install build essentials dan tools dasar
sudo apt install -y build-essential curl wget git unzip software-properties-common

# Install Node.js dan npm (menggunakan NodeSource repository)
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs

# Verify Node.js installation
node --version
npm --version

# Install pnpm dan yarn (package managers alternatif)
npm install -g pnpm yarn

# Install Go
wget https://go.dev/dl/go1.21.5.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.21.5.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc

# Verify Go installation
go version
```

## 2. Install Neovim

```bash
# Install Neovim (stable version)
sudo apt install -y neovim

# Atau install versi terbaru dari AppImage
wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod +x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

# Install ripgrep untuk telescope search
sudo apt install -y ripgrep

# Install fd-find untuk file searching
sudo apt install -y fd-find
ln -s $(which fdfind) ~/.local/bin/fd

# Install additional tools
sudo apt install -y xclip # untuk clipboard support
```

## 3. Setup Neovim Configuration

```bash
# Backup konfigurasi lama jika ada
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null || true

# Clone atau copy konfigurasi Neovim
mkdir -p ~/.config/nvim

# Copy semua file konfigurasi yang telah dimodifikasi ke ~/.config/nvim/
# Struktur direktori:
# ~/.config/nvim/
# ├── init.lua
# ├── .lazyvim.json
# └── lua/
#     ├── config/
#     │   ├── lazy.lua
#     │   ├── options.lua
#     │   ├── keymaps.lua
#     │   └── autocmds.lua
#     └── plugins/
#         ├── colorscheme.lua
#         ├── lsp.lua
#         ├── cmp.lua
#         ├── treesitter.lua
#         ├── mason.lua
#         ├── telescope.lua
#         ├── editor.lua
#         └── ui.lua
```

## 4. Install Tmux

```bash
# Install tmux
sudo apt install -y tmux

# Setup tmux configuration
mkdir -p ~/.config/tmux

# Copy file konfigurasi tmux:
# ~/.config/tmux/
# ├── .tmux.conf
# └── statusline.conf

# Atau buat symlink dari file konfigurasi yang ada
ln -sf ~/.config/tmux/.tmux.conf ~/.tmux.conf
```

## 5. First Run Setup

### Neovim First Run:

```bash
# Jalankan Neovim untuk pertama kali
nvim

# Lazy.nvim akan otomatis:
# 1. Download dan install plugin manager
# 2. Install semua plugins yang diperlukan
# 3. Setup LSP servers melalui Mason

# Jika ada error, jalankan command ini di Neovim:
:Lazy sync
:Mason
```

### Install Language Servers secara Manual (jika diperlukan):

```bash
# Buka Neovim dan jalankan:
:MasonInstall typescript-language-server
:MasonInstall vue-language-server
:MasonInstall json-lsp
:MasonInstall css-lsp
:MasonInstall tailwindcss-language-server
:MasonInstall emmet-ls
:MasonInstall gopls
:MasonInstall prettier
:MasonInstall eslint_d
:MasonInstall gofumpt
:MasonInstall goimports
:MasonInstall delve
```

## 6. Testing Setup

### Test JavaScript/TypeScript:

```bash
# Buat project test
mkdir ~/test-js && cd ~/test-js
npm init -y
npm install -D typescript @types/node

# Buat file test
echo 'console.log("Hello TypeScript!");' > index.ts

# Edit dengan Neovim
nvim index.ts
```

### Test Vue.js:

```bash
# Buat Vue project
npm create vue@latest my-vue-app
cd my-vue-app
npm install

# Edit dengan Neovim
nvim src/App.vue
```

### Test React:

```bash
# Buat React project
npx create-react-app my-react-app --template typescript
cd my-react-app

# Edit dengan Neovim
nvim src/App.tsx
```

### Test Go:

```bash
# Buat Go project
mkdir ~/test-go && cd ~/test-go
go mod init test-go

# Buat file test
echo 'package main

import "fmt"

func main() {
    fmt.Println("Hello Go!")
}' > main.go

# Edit dengan Neovim
nvim main.go
```

## 7. Keybindings Penting

### Neovim (berdasarkan konfigurasi):

- `<Space>` - Leader key
- `<Space>w` - Save file
- `<Space>q` - Quit
- `<Space>sv` - Split vertically
- `<Space>sh` - Split horizontally
- `<Space>to` - Open new tab
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Show hover documentation
- `<Space>ca` - Code actions
- `<Space>rn` - Rename symbol
- `<Space>ff` - Find files (Telescope)
- `<Space>fg` - Live grep (Telescope)
- `jk` - Exit insert mode

### Tmux (berdasarkan konfigurasi):

- `Ctrl+a` - Prefix key
- `Prefix + |` - Split vertical
- `Prefix + -` - Split horizontal
- `Prefix + h/j/k/l` - Navigate panes
- `Prefix + r` - Reload config

## 8. Troubleshooting

### Jika LSP tidak bekerja:

```bash
# Check health Neovim
nvim
:checkhealth

# Restart LSP
:LspRestart

# Check Mason installations
:Mason
```

### Jika Node.js tools tidak terdeteksi:

```bash
# Pastikan PATH correct
echo $PATH
which node
which npm

# Restart shell session
source ~/.bashrc
```

### Jika Go tools tidak bekerja:

```bash
# Check Go environment
go env GOPATH
go env GOROOT

# Install Go tools manually
go install golang.org/x/tools/gopls@latest
go install golang.org/x/tools/cmd/goimports@latest
```

## 9. Performance Tips untuk VPS

1. **Disable swap jika memori cukup:**

```bash
sudo swapoff -a
```

2. **Optimize Neovim startup:**

```bash
# Check startup time
nvim --startuptime startup.log +qall
```

3. **Use minimal colorscheme untuk SSH:**
   Set `TERM=xterm-256color` di SSH client.

## 10. Maintenance

### Update packages:

```bash
# Update sistem
sudo apt update && sudo apt upgrade -y

# Update Node.js packages
npm update -g

# Update Go
# Download versi terbaru dan replace installation

# Update Neovim plugins
nvim
:Lazy sync
:Mason update
```

### Backup configuration:

```bash
# Backup configs
tar -czf ~/nvim-config-backup.tar.gz ~/.config/nvim ~/.config/tmux ~/.tmux.conf
```

Setelah setup selesai, Anda akan memiliki environment development yang powerful dan efisien untuk JavaScript, TypeScript, React, Vue.js, Go, dan Node.js development di VPS Ubuntu Anda.
