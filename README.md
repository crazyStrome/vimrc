# vimrc

具体的软件安装以及配置可以参考我的[DockerFile](https://github.com/crazyStrome/vimrc/blob/master/Dockerfile)

vim配置，使用vim-plug管理,配置golang开发环境，包括文件树，tag树，跳转，补全。

repo中的init.vim-nvim用于neovim配置。
##  neovim安装
参考：

[Neovim+Coc.nvim配置 目前个人最舒服终端编辑环境(Python&C++)](https://www.cnblogs.com/cniwoq/p/13272746.html)

centos 7仓库中的neovim版本太低，因此需要自己下载安装最近版本的neovim。

从[neovim下载地址](https://github.com/neovim/neovim/releases)下载最新的tar文件，例如nvim-linux64.tar.gz，使用tar指令解压缩到一个目录：
```bash
tar -vxf nvim-linux.tar.gz /usr/local
mv /usr/local/nvim-linux /usr/local/nvim
cd /usr/bin
sudo su
ln -s /usr/local/nvim/bin/nvim nvim
```
这样就建立了一个nvim的链接，在控制台上输入nvim就可以直接打开nvim了。

##  vim-plug等配置
见教程[plug配置教程](https://pokitpeng.github.io/posts/linux/vim%E6%89%93%E9%80%A0golang%E5%BC%80%E5%8F%91%E7%8E%AF%E5%A2%83/)

[coc.nvim配置](https://zhuanlan.zhihu.com/p/102306124)

执行如下指令，克隆我的vim配置：
```bash
git clone https://github.com/crazyStrome/vimrc
cd vimrc/
cp init.vim-nvim ~/.config/nvim/init.vim
```
然后在控制台上输入如下指令安装vim-plug，它用来管理我们的插件。
```bash
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
在控制台上输入nvim，然后依次输入
```
:PlugInstall
:GoInstallBinaries
:CocInstall coc-go coc-json coc-yaml coc-protobuf coc-explorer coc-git
```
到这里，nvim基本就可以用了。

F9打开和关闭NerdTree。F10打开和关闭taglist。

Ctrl+]代码跳转，Ctrl+o或t代码跳回。

gd跳转到定义处，gr跳转到引用处

K打开当前变量或函数的描述。

Ctrl+n在insert模式中选择下一个补全项，反向使用Ctrl+p

剩下的看init.vim吧。

有问题提issue，随时更

## 已经配置好的docker镜像
环境centos
安装完docker，执行
```bash
docker pull crazystrome/centos:nvim
```
就把我的镜像拉下来了。

我的DockerFile也放在这里[DockerFile](https://github.com/crazyStrome/vimrc/blob/master/Dockerfile)

如果你们是其他的环境，也可以在此基础上修改。
