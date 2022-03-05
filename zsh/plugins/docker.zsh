# Vanilla docker
function dib() {
  docker image build --tag $1 .
}

alias dcr='docker container run'

# docker-compose
alias dcb='docker-compose build'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
