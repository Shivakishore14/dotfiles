setenv() {
	# use the file .env as default if no parameters specified
	filename=${1:-".env"}
	defaultvars=$(cat testfile.env | sed -e '/^\[/Q' -e '/^\W*$/d;/^#/d'|xargs)

	echo "Setting vars $defaultvars"
	export $defaultvars
	if [ -n "$data" ]
	then
		vars=$( cat $filename | sed -n -e '/\['"$data"'\]/, /^\[/p' | sed -e '/^\[/d' -e '/^\W*$/d;/^#/d' | xargs)
		echo "Setting Override vars $vars"
		export $vars
	fi
}
