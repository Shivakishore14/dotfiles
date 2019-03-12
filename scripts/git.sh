
# shortcut for git push
gp() {
	branch=$(git branch | grep '\*' | sed 's/\*\W*//')
	echo "Pushing to branch : $branch"
	git push origin $branch
}
