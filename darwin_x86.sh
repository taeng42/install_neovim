#!/bin/bash

cd `dirname $0`
SCRIPT_PATH=`pwd`

NVIM_LOCAL_PATH=$HOME/.nvim_local/
NVIM_PATH=$HOME/nvim-macos

TS=`date +%s`

/bin/mv $NVIM_LOCAL_PATH ${NVIM_LOCAL_PATH}_${TS}.bak
/bin/mv ${NVIM_PATH} ${NVIM_PATH}_${TS}.bak
/bin/mv $HOME/.cache/nvim $HOME/.cache/nvim_${TS}.bak

/bin/mkdir -p $NVIM_LOCAL_PATH/bin
/bin/mkdir -p $NVIM_LOCAL_PATH/include
/bin/mkdir -p $NVIM_LOCAL_PATH/lib
/bin/mkdir -p $NVIM_LOCAL_PATH/share

#mv $NVIM_LOCAL_PATH/share/nvim $NVIM_LOCAL_PATH/share/nvim_${TS}.bak
#mv $NVIM_LOCAL_PATH/state/nvim $NVIM_LOCAL_PATH/state/nvim_${TS}.bak

cd $HOME \
	&& /bin/mkdir -p nvim_tmp \
	&& cd nvim_tmp

curl -L https://nodejs.org/dist/v18.18.0/node-v18.18.0-darwin-x64.tar.gz -o node.tar.gz\
	&& /bin/mkdir node_tmp \
	&& tar xzvf node.tar.gz -C node_tmp\
	&& /bin/mv node_tmp/*/* node_tmp/ \
	&& /bin/cp -af node_tmp/bin $NVIM_LOCAL_PATH \
	&& /bin/cp -af node_tmp/include $NVIM_LOCAL_PATH \
	&& /bin/cp -af node_tmp/lib $NVIM_LOCAL_PATH \
	&& /bin/cp -af node_tmp/share $NVIM_LOCAL_PATH

curl -L -O https://github.com/neovim/neovim/releases/download/v0.9.2/nvim-macos.tar.gz \
	&& xattr -c ./nvim-macos.tar.gz \
	&& tar xzvf nvim-macos.tar.gz \
	&& /bin/mv nvim-macos $NVIM_PATH

/bin/mv $HOME/.config/nvim $HOME/.config/nvim_${TS}.bak
git clone --depth 1 https://github.com/AstroNvim/AstroNvim $HOME/.config/nvim
git clone https://github.com/taeng42/nvim-config.git $HOME/.config/nvim/lua/user \
	&& cp -af $HOME/.config/nvim/lua/user/lsp/config/.clang-format $HOME

/bin/rm $NVIM_LOCAL_PATH/bin/glow
curl -L -o glow.tar.gz https://github.com/charmbracelet/glow/releases/download/v1.5.1/glow_Darwin_x86_64.tar.gz && tar xzvf glow.tar.gz && mv glow $NVIM_LOCAL_PATH/bin/glow 

bash ${SCRIPT_PATH}/end_msg.sh ${NVIM_LOCAL_PATH} ${NVIM_PATH}
rm -rf $HOME/nvim_tmp
