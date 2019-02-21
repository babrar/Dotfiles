if [ -z "$1" ]; then
	echo "Usage: ./script \"<commit-msg>\""
	exit 1
fi

cp ~/.zshrc $PWD/.zshrc
cp ~/.vimrc $PWD/.vimrc
cp ~/.bashrc $PWD/.bashrc
cp ~/.tmux.conf $PWD/.tmux.conf

# work to add .config for powerline

git add .
git commit -m "$1"
git push origin master

exit 0
