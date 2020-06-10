# ---- Aliases ----

alias dcb='docker-compose build'
alias dcdn='docker-compose down'
alias dcla='docker stop $(docker container ls -a -q) && docker system prune -a -f --volumes'
alias dcr='docker-compose run --rm'
alias dcup='docker-compose up'

# --- Functions ---
function dcrdbm() { docker-compose run --rm ${1:-app} rails db:migrate }
function dcrdbr() { docker-compose run --rm ${1:-app} rails db:reset }
function dcrdbs() { docker-compose run --rm ${1:-app} rails db:setup }
function docker_pg_restore() {
  if [ $# -ne 3 ]; then
    echo "Error lacking arguments: docker_pg_restore #{container_id} #{database_name} #{dump_path}"
    return 1
  else
    docker exec -i "$1" pg_restore -U postgres -v -c -O -d "$2" < "$3"
  fi
}
