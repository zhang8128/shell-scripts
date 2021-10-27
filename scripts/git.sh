main () {
  git checkout main
  git pull origin main
}

branch () {
  git checkout -b $1
}

reset () {
  git reset --hard origin/main
}

prune () {
  git branch | grep -v "main" | xargs git branch -D
}

pull () {
  if [ $1 ]; then
    if [ $1 = 'm' ]; then
      git pull origin main
    else
      git pull origin $1
    fi
  else
    eval branch_name=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
    git pull origin $branch_name
  fi
}

push () {
  eval branch_name=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
  if [ $branch_name != 'main' ]; then
    git push origin $branch_name
  else
    echo "cannot push to main"
  fi
}

commit () {
  git add . -A
  git commit -m "$1"
}

stash () {
  if [ $1 ]; then
    if [ $1 = 'c' ]; then
      git stash clear
    else
      git stash $1
    fi
  else
    git stash
  fi
}
