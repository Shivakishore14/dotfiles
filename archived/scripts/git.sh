
# shortcut for git push
gp() {
	branch=$(gp_current_branch)
	echo "Pushing to branch : $branch"
	git push origin $branch
}

gp_current_branch() {
	branch=$(git branch | grep '\*' | sed 's/\*\W*//')
	echo $branch
}

gdi() {
	# cached files
	g_diff_i $(git diff --cached --name-only | xargs)
	# Modified files
	g_diff_i $(git ls-files -m | xargs)
	# Untracked files
	g_diff_i $(git ls-files -o | xargs)
}

g_diff_i() {
	for i; do 
		g_diff_i_file $i
	done	
	cls
	git status
}

g_diff_i_file() {
	cls
	echo "File: $1"
	git --no-pager diff HEAD $1

	loop_choice=1
	while [ $loop_choice -ne 0 ]
	do
		echo "[a]dd, [r]eset, [q]uit"
		read choice

		g_set_choice $1 $choice
		loop_choice=$?
	done
	git status -s $1
	read dummy
}

g_set_choice() {
	if [ "$2" = "a" ]
	then
		git add $1
	elif [ "$2" = "r" ]
	then
		git reset $1 -q
	elif [ "$2" = "q" ]
	then
		return 0
	else
		return 1
	fi
}
cls() {
	printf "\ec"
}
