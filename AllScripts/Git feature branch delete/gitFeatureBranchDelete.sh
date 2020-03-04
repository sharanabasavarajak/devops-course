echo -e "Enter the validation date ( YYYY-MM-DD ): "
read date_validate
>| list_repo
ls -d */ | while read line1
do
	#line1="$(echo -e "${line}" | tr -d '[:space:]')"
	cd ${line1}
	#git fetch --all
	git pull --all
	git fetch --prune
	echo -e "Deleting following branches under repository ${line1}\n" >> ../list_repo
	for branch in `git branch -r | grep -v HEAD | grep feature`
	do
		lastcommit_date=`git show --format="%ci" $branch | head -n 1 | awk '{print $1}'`

		if [[ "$lastcommit_date" < "$date_validate" ]]
		then
			echo -e `git show --format="%ci" $branch | head -n 1` \\t$branch >> ../list_repo
			git branch -D $branch
			git push origin --delete $branch
		fi

	done
	cd ..
done
