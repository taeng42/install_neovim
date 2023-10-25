#!/bin/bash

cd `dirname $0`
SCRIPT_PATH=`/bin/pwd`

NVIM_LOCAL_NAME=".nvim_local"
NVIM_LOCAL_PATH=$HOME/$NVIM_LOCAL_NAME
NVIM_NAME="nvim-linux"
NVIM_PATH=$HOME/$NVIM_NAME
NVIM_BACKUP_PATH=$HOME/nvim-backup
TS=`date +%s`
NVIM_BACKUP_PATH="${NVIM_BACKUP_PATH}/${TS}"

/bin/mkdir -p $NVIM_BACKUP_PATH > /dev/null 2>&1
/bin/mkdir -p $NVIM_BACKUP_PATH/.cache > /dev/null 2>&1

/bin/mv $NVIM_LOCAL_PATH "${NVIM_BACKUP_PATH}/${NVIM_LOCAL_NAME}" > /dev/null 2>&1
/bin/mv ${NVIM_PATH} "${NVIM_BACKUP_PATH}/${NVIM_NAME}" > /dev/null 2>&1
/bin/mv $HOME/.cache/nvim $NVIM_BACKUP_PATH/.cache/nvim > /dev/null 2>&1

/bin/mkdir -p $NVIM_LOCAL_PATH/bin > /dev/null 2>&1
/bin/mkdir -p $NVIM_LOCAL_PATH/include > /dev/null 2>&1
/bin/mkdir -p $NVIM_LOCAL_PATH/lib > /dev/null 2>&1
/bin/mkdir -p $NVIM_LOCAL_PATH/share > /dev/null 2>&1
/bin/mkdir -p $NVIM_LOCAL_PATH/share/man/man1 > /dev/null 2>&1

cd $HOME
/bin/mkdir -p nvim_tmp > /dev/null 2>&1
cd nvim_tmp

/bin/mkdir -p node_tmp > /dev/null 2>&1
curl -L https://nodejs.org/dist/v18.18.0/node-v18.18.0-linux-x64.tar.gz -o node.tar.gz\
	&& tar xvf node.tar.gz -C node_tmp > /dev/null 2>&1\
	&& /bin/mv node_tmp/*/* node_tmp/ > /dev/null 2>&1 \
	&& /bin/cp -af node_tmp/bin $NVIM_LOCAL_PATH > /dev/null 2>&1 \
	&& /bin/cp -af node_tmp/include $NVIM_LOCAL_PATH > /dev/null 2>&1 \
	&& /bin/cp -af node_tmp/lib $NVIM_LOCAL_PATH > /dev/null 2>&1 \
	&& /bin/cp -af node_tmp/share $NVIM_LOCAL_PATH > /dev/null 2>&1

curl -L https://github.com/neovim/neovim/releases/download/v0.9.2/nvim-linux64.tar.gz -o nvim-linux64.tar.gz \
	&& tar xzvf nvim-linux64.tar.gz > /dev/null 2>&1 \
	&& /bin/cp -af nvim-linux64 $NVIM_PATH > /dev/null 2>&1

/bin/mv $HOME/.config/nvim $NVIM_BACKUP_PATH/.config/nvim_${TS}.bak > /dev/null 2>&1
git clone --depth 1 https://github.com/AstroNvim/AstroNvim $HOME/.config/nvim \
	&& git clone https://github.com/taeng42/nvim-config.git $HOME/.config/nvim/lua/user \
	&& /bin/cp -af $HOME/.config/nvim/lua/user/lsp/config/.clang-format $HOME > /dev/null 2>&1

curl -L -o glow.tar.gz https://github.com/charmbracelet/glow/releases/download/v1.5.1/glow_Linux_x86_64.tar.gz \
	&& tar xzvf glow.tar.gz > /dev/null 2>&1 \
	&& /bin/cp -af glow $NVIM_LOCAL_PATH/bin/glow > /dev/null 2>&1 

/bin/rm $NVIM_LOCAL_PATH/bin/rg > /dev/null 2>&1
/bin/mkdir -p rg_tmp > /dev/null 2>&1
curl -L -o rg.tar.gz https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep-12.1.1-x86_64-unknown-linux-musl.tar.gz \
	&& tar xzvf rg.tar.gz -C rg_tmp > /dev/null 2>&1 \
	&& /bin/mv rg_tmp/ripgrep-*/rg $NVIM_LOCAL_PATH/bin/rg > /dev/null 2>&1 \
	&& /bin/mv rg_tmp/ripgrep-*/doc/rg.1 ${NVIM_LOCAL_PATH}/share/man/man1 > /dev/null 2>&1 

bash ${SCRIPT_PATH}/end_msg.sh ${NVIM_LOCAL_PATH} ${NVIM_PATH}
rm -rf $HOME/nvim_tmp
