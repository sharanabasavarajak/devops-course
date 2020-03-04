cat repolist | while read line
do
git clone https://AG48558@bitbucket.anthem.com/scm/cng/${line}
done
