if [[ "$OSTYPE" == darwin* ]]; then
  alias f='open -a Finder ./'
else
  alias f='xdg-open ./ >/dev/null 2>&1'
fi
alias ll='ls -a'
alias p='python3'
alias edit='subl'
alias scripts="edit ${0:A:h:h} ."

resource () {
  source ~/.zshrc
}

up () {
  cd ..
}

update () {
  if [[ "$OSTYPE" == darwin* ]]; then
    brew update
    brew upgrade
  else
    sudo apt update
    sudo apt upgrade -y
    command -v snap >/dev/null && sudo snap refresh
  fi
}

del () {
  rm -rf $1
}

makemigrations() {
  python manage.py makemigrations
}

migrate() {
  python manage.py migrate
}
