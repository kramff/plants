echo "push a git commit."
$commit = Read-Host -Prompt "what to put in the commit message? "
git add .
git commit -m $commit
git push


