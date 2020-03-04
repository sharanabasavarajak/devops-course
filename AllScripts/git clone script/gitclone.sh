cat repolist | while real line
do
git clone https://AG48558@bitbucket.anthem.com/scm/cng/${line}.git
done
