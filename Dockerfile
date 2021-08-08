# 说明该镜像以哪个镜像为基础
FROM centos:latest

# 构建者的基本信息
MAINTAINER crazystrome

# 在build这个镜像时执行的操作
RUN yum update
RUN yum install -y git
RUN yum install -y python2
RUN yum install -y python2
RUN yum install -y go
RUN dnf module install -y nodejs:12
# 安装nvim的python支持
RUN pip3 install --user --upgrade pynvim
# ctags 解析标签
RUN yum install -y ctags
RUN cd home/
RUN mkdir Download
RUN cd Download
RUN yum install -y wget
RUN wget https://github.com/neovim/neovim/releases/download/v0.5.0/nvim-linux64.tar.gz
RUN tar -vxf nvim-linux64.tar.gz
RUN cp -r nvim-linux64 /usr/local/nvim
RUN cd /bin
# 建立nvim链接
RUN ln -s /usr/local/nvim/bin/nvim nvim

# nvim配置目录
RUN mkdir -p ~/.config/nvim

RUN cd ~

RUN git clone https://github.com/crazyStrome/vimrc
RUN cp vimrc/init.vim-nvim .config/nvim/init.vim
RUN curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# :PlugInstall
# :GoInstallBinaries
# :CocInstall coc-go coc-json coc-yaml coc-protobuf

# Ready
