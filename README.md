# vim
vim configurations

## 使用[coc.nvim](https://github.com/neoclide/coc.nvim)进行代码提示和自动补全

Install vim-plug:
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Install extensions like:
```
:CocInstall coc-json coc-tsserver
```

Or configure language server in coc-settings.json opened by :CocConfig, like:
```
{
  "languageserver": {
    "go": {
      "command": "gopls",
      "rootPatterns": ["go.mod"],
      "trace.server": "verbose",
      "filetypes": ["go"]
    }
  }
}
```

Install gopls:
```
go install golang.org/x/tools/gopls@latest
```


## 使用clangd进行C/C++代码补全

clangd安装：
```
apt install clangd-10
```
安装完的二进制文件在/usr/bin/clangd-10
