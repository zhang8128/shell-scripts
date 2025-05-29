alias f='xdg-open .'
alias ll='ls -a'
alias p='python3'
alias edit='subl'
alias scripts='edit ~/.utils/shell-scripts/ .'

resource () {
  source ~/.bashrc
}

up () {
  cd ..
}

update () {
  brew update
  brew upgrade
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
