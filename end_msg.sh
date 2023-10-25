#!/bin/bash
NVIM_LOCAL_PATH=$1
echo "if you can't find something binaries, you need this command."
echo "---------------------------------------------------------------"
echo "export PATH=\"${HOME}/nvim-linux/bin:\$PATH\" >> ${HOME}/.profile"
echo "export PATH=\"${NVIM_LOCAL_PATH}:\$PATH\" >> ${HOME}/.profile"
echo "---------------------------------------------------------------"
echo "AND YOU MAY NEED REBOOT!!"

