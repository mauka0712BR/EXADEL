git clone git@github.com:mauka0712BR/Exadel.git
cd Exadel
mkdir ./Task1
echo "#read this text" >> ./Task1/README.md
git add ./Task1/README.md
git commit -m "Create new file"
git push git@github.com:mauka0712BR/Exadel.git
git checkout -b dev
git push origin dev
echo "#test_message" >> test_file
git add test_file
git commit -m "Create test file"
git push git@github.com:mauka0712BR/Exadel.git
git checkout -b mauka0712BR-new_feature
echo "#read this text" >> ./README.md
git status
echo '!.gitignore' >> .gitignore
echo '#ignore all files starts with "."' >> .gitignore
echo '.*' >> .gitignore
git add ./README.md
git commit -m "Create new file"
git add -f .gitignore
git commit -m "Create gitignore file"
git push git@github.com:mauka0712BR/Exadel.git

#PR and Merge were made in web browser

git clone git@github.com:mauka0712BR/Exadel.git

git remote -v
git remote add upstream git@github.com:mauka0712BR/Exadel.git
git fetch upstream
echo "#add some changes" >> ./README.md
git add ./README.md
git commit -m "add some changes"
git reset --soft HEAD~1
git stash
git checkout main
git log mauka0712BR-new_feature >> log.txt
git add log.txt
git commit -m "Create log file"
git push git@github.com:mauka0712BR/Exadel.git
git branch -D mauka0712BR-new_feature
git push origin --delete mauka0712BR-new_feature
git checkout dev
nano git_commands.md
