# vim
vim configurations

## Install YouCompleteMe

1. 确保vim版本大于等于7.4，并且在vim中执行：
```
:version
```
结果中python和python3的支持都是+。如果如果不是，可以根据所使用的发行版查找解决方法。

2. 通过执行下列命令，下载plug.vim并放入~/.vim/autoload目录中：
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

3. 在vim中执行:PlugInstall下载安装YouCompleteMe，下载过程较慢，可以使用如下方法设置代理：
```
# 设置socks5代理
git config --global http.proxy 'socks5://<ip>:<port>'
git config --global https.proxy 'socks5://<ip>:<port>'

# 设置http代理
git config --global http.proxy http://<ip>:<port>
git config --global https.proxy https://<ip>:<port>

# 取消设置代理
git config --global --unset http.proxy
git config --global --unset https.proxy
```

由于YouCompleteMe依赖较多，一般情况下这一步会卡住或者出错。
4. 如果第2步出错，并提示：
```
File <file> does not exist; you probably forgot to run:
    git submodule update --init --recursive
```
则进入~/.vim/plugged/YouCompleteMe文件夹下，执行：
```
git submodule update --init --recursive
```

5. 执行完第3步之后，进入~/.vim/plugged/YouCompleteMe中，执行：
```
python install.py --clang-completer
或者
python3 install.py --clang-completer
```

6. YouCompleteMe依赖libclang8进行自动提示，安装脚本默认从网上下载编译好的二进制库，但是经常会遇到无法下载的问题：
```
-- Found PythonLibs: /usr/lib64/libpython3.6m.so (found suitable version "3.6.8", minimum required is "3.5") 
-- Downloading libclang 8.0.0 from https://dl.bintray.com/micbou/libclang/libclang-8.0.0-x86_64-unknown-linux-gnu.tar.bz2
CMake Error at ycm/CMakeLists.txt:107 (file):
      file DOWNLOAD HASH mismatch

          for file: [/home/user/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/../clang_archives/libclang-8.0.0-x86_64-unknown-linux-gnu.tar.bz2]
                expected hash: [e81a186cd1180ae80c17d67d8d0c101248f8ee032d138cf6f1e95001e733249c]
                        actual hash: [e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855]
                                     status: [6;"Couldn't resolve host name"]
```
这时可以从https://dl.bintray.com/micbou/libclang/libclang-8.0.0-x86_64-unknown-linux-gnu.tar.bz2手动下载，并放入.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/../clang_archives/libclang-8.0.0-x86_64-unknown-linux-gnu.tar.bz2目录下，再次执行：
```
python(3) install.py --clang-completer
```
就可以成功安装YouCompleteMe了。
