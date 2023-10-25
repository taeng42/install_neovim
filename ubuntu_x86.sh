NVIM_LOCAL_PATH=$HOME/.nvim_local/
#NVIM_LOCAL_PATH=$HOME/.local/

TS=`date +%s`

/bin/mv $NVIM_LOCAL_PATH ${NVIM_LOCAL_PATH}_${TS}.bak
/bin/mv $HOME/nvim-ubuntu $HOME/nvim-ubuntu_${TS}.bak
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

curl -L https://nodejs.org/dist/v18.18.0/node-v18.18.0-linux-x64.tar.gz -o node.tar.gz\
	&& /bin/mkdir node_tmp \
	&& tar xvf node.tar.gz -C node_tmp\
	&& /bin/mv node_tmp/*/* node_tmp/ \
	&& /bin/cp -af node_tmp/bin $NVIM_LOCAL_PATH \
	&& /bin/cp -af node_tmp/include $NVIM_LOCAL_PATH \
	&& /bin/cp -af node_tmp/lib $NVIM_LOCAL_PATH \
	&& /bin/cp -af node_tmp/share $NVIM_LOCAL_PATH

#curl -L -O https://github.com/neovim/neovim/releases/download/stable/nvim-ubuntu.tar.gz
curl -L -O https://github.com/neovim/neovim/releases/download/v0.9.2/nvim-linux64.tar.gz \
	&& xattr -c ./nvim-ubuntu.tar.gz \
	&& tar xzvf nvim-ubuntu.tar.gz \
	&& /bin/mv nvim-ubuntu $HOME/nvim-ubuntu

/bin/mv $HOME/.config/nvim $HOME/.config/nvim_${TS}.bak
git clone --depth 1 https://github.com/AstroNvim/AstroNvim $HOME/.config/nvim
git clone https://github.com/taeng42/nvim-config.git $HOME/.config/nvim/lua/user \
	&& cp -af $HOME/.config/nvim/lua/user/lsp/config/.clang-format $HOME

/bin/rm $NVIM_LOCAL_PATH/bin/glow
curl -L -o glow.tar.gz https://github.com/charmbracelet/glow/releases/download/v1.5.1/glow_Linux_x86_64.tar.gz && tar xzvf glow.tar.gz && mv glow $NVIM_LOCAL_PATH/bin/glow 
#https://github.com/charmbracelet/glow/releases/download/v1.5.1/glow_Darwin_arm64.tar.gz
#https://github.com/charmbracelet/glow/releases/download/v1.5.1/glow_1.5.1_amd64.deb


/bin/rm $NVIM_LOCAL_PATH/bin/rg
mkdir -p rg_tmp
#/bin/rm $NVIM_LOCAL_PATH/share/
curl -L -o rg.tar.gz https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep-12.1.1-x86_64-unknown-linux-musl.tar.gz && tar xzvf rg.tar.gz -c rg_tmp && mv rg_tmp/*/rg $NVIM_LOCAL_PATH/bin/rg 

rm -rf $HOME/nvim_tmp
