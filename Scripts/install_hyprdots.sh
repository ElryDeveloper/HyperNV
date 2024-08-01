#!/usr/bin/env bash
#|---/ /+--------------------------+---/ /|#
#|--/ /-| Main installation script |--/ /-|#
#|-/ /--| Prasanth Rangan          |-/ /--|#
#|-/ /--| Edited by Elry           |-/ /--|#
#|/ /---+--------------------------+/ /---|#

cat << "EOF"

-------------------------------------------------
        .
       / \         _       _  _      ___  ___ 
      /^  \      _| |_    | || |_  _|   \| __|
     /  _  \    |_   _|   | __ | || | |) | _| 
    /  | | ~\     |_|     |_||_|\_, |___/|___|
   /.-'   '-.\                  |__/          

-------------------------------------------------

EOF

#--------------------------------#
# import variables and functions #
#--------------------------------#
scrDir=$(dirname "$(realpath "$0")")
source "${scrDir}/global_fn.sh"
if [ $? -ne 0 ]; then
    echo "Error: unable to source global_fn.sh..."
    exit 1
fi


#------------#
# installing #
#------------#
cat << "EOF"

 _         _       _ _ _
|_|___ ___| |_ ___| | |_|___ ___
| |   |_ -|  _| .'| | | |   | . |
|_|_|_|___|_| |__,|_|_|_|_|_|_  |
                            |___|

EOF

#----------------------#
# prepare package list #
#----------------------#
shift $((OPTIND - 1))
cust_pkg=$1
cp "${scrDir}/custom_hypr.lst" "${scrDir}/install_pkg.lst"

if [ -f "${cust_pkg}" ] && [ ! -z "${cust_pkg}" ]; then
    cat "${cust_pkg}" >> "${scrDir}/install_pkg.lst"
fi

#--------------------------------#
# add nvidia drivers to the list #
#--------------------------------#
if nvidia_detect; then
    cat /usr/lib/modules/*/pkgbase | while read krnl; do
        echo "${krnl}-headers" >> "${scrDir}/install_pkg.lst"
    done
    nvidia_detect --drivers >> "${scrDir}/install_pkg.lst"
fi

nvidia_detect --verbose

export getAur="yay"
export myShell="fish"
echo "${myShell}" >> "${scrDir}/install_pkg.lst"


#--------------------------------#
# install packages from the list #
#--------------------------------#
"${scrDir}/install_pkg.sh" "${scrDir}/install_pkg.lst"
rm "${scrDir}/install_pkg.lst"

cp "${scrDir}/custom_apps.lst" "${scrDir}/install_pkg.lst"
"${scrDir}/install_pkg.sh" "${scrDir}/install_pkg.lst"
rm "${scrDir}/install_pkg.lst"

