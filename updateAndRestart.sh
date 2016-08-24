WORKDIR=$PWD
cd $WORKDIR/multiplelp-config && docker-compose stop && docker-compose rm -f
cd $WORKDIR && find . -name *.lock | xargs -i rm {}
cd $WORKDIR/multiplelp-config && docker-compose build && docker-compose up -d

