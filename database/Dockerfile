FROM postgres:15-alpine
WORKDIR /var/lib/postgresql/data
ENV POSTGRES_PASSWORD=post123
ENV POSTGRES_DB=panqueca
ENV PGDATA=/var/lib/postgresql/data/pgdata
COPY ./InicializacaoBanco.sql /docker-entrypoint-initdb.d/10-init.sql
VOLUME ./:/var/lib/postgresql/data

