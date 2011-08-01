if [ "$1" == "" ]; then
  echo ""
  echo "Usage to install hl's vimrc:"
  echo "   sh $script_full_path/install.sh <system>"
  echo "      - where <system> can be 'mac', 'linux' or 'windows'"
  exit 1
fi
script_full_path=$(cd "$(dirname "$0")"; pwd)

echo $script_full_path
echo "
fun! MySys()
   return '$1'
endfun
fun! UpdateCFG()
	source $script_full_path/_vimrc
    echomsg 'Update vimrc OK'
	return
endfun
fun! EditCFG()
	sp $script_full_path/_vimrc
endfun
set runtimepath=$script_full_path,$script_full_path/after,\$VIMRUNTIME
source $script_full_path/_vimrc
helptags $script_full_path/doc" > ~/.vimrc
$(ls ~/.vim/sessions) || $(mkdir -p  ~/.vim/sessions)
echo "Installed hl's vim configuration successfully! Enjoy :)"
