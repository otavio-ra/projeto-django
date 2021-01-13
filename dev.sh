HOST=otavioalmeida.busercamp.com.br

function devhelp() {
  echo "dkbuild     constroi a imagem docker"
  echo "dkrun       roda o proketo dockerizado"
  echo "deploy      da deploy no projeto"
}

function dkbuild() {
  docker build -t otavioalmeida .
}

function dkrun() {
  docker run -it -p 8000:8000 \
         -e DATABASE_FILE=/dkdata/db.sqlite3 \
         -e DJANGO_STATIC_ROOT=/dkdata/static \
         -v $(pwd)/dkdata:/dkdata \
         otavioalmeida start.sh
}

function deploy(){
  rsync -av --exclude dkdata --exclude db.sqlite3 \
        ./* ubuntu@$HOST:./otavioalmeida/
  ssh ubuntu@$HOST "cd otavioalmeida && ./dkrunprod.sh"
}
