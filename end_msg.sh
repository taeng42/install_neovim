#!/bin/bash
NVIM_LOCAL_PATH=$1
NVIM_PATH=$2
SHELL_NAME=`basename ${SHELL}`

if [[ "${SHELL_NAME}" == "bash" ]]; then
	PROFILE=".bash_profile"
elif [[ "${SHELL_NAME}" == "zsh" ]]; then
	PROFILE=".zshenv"
elif [[ "${SHELL_NAME}" == "sh" ]]; then
	PROFILE=".profile"
elif [[ "${SHELL_NAME}" == "tcsh" ]]; then
	PROFILE=".tcshrc"
elif [[ "${SHELL_NAME}" == "csh" ]]; then
	PROFILE=".cshrc"
elif [[ "${SHELL_NAME}" == "ksh" ]]; then
	PROFILE=".profile"
else
	PROFILE=".profile"
fi

echo "if you can't find something binaries, you need this command."
echo "---------------------------------------------------------------"
echo "echo 'export PATH=\"${NVIM_PATH}/bin:\$PATH\"' >> ${HOME}/${PROFILE};"
echo "echo 'export PATH=\"${NVIM_LOCAL_PATH}/bin:\$PATH\"' >> ${HOME}/${PROFILE};"
echo "---------------------------------------------------------------"
echo "AND YOU MAY(?) NEED REBOOT!!"
