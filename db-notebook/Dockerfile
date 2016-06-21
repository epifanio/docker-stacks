# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM epinux/extended-notebook

USER root

RUN useradd -m -s /bin/bash postgres
RUN echo "postgres:postgres" | chpasswd

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
	postgresql-9.5 \
	postgresql-client-9.5 \
	postgresql-contrib-9.5 \
	postgis \
	postgresql-9.5-postgis-2.2 \
	postgresql-9.5-postgis-scripts \
	postgresql-contrib \
	php5-pgsql phppgadmin \
	python-sqlalchemy \
	python3-sqlalchemy python3-psycopg2 python-psycopg2 \
	apache2

RUN pip3 install geoalchemy2 && pip install geoalchemy2

USER postgres

# start db and make new user and db (epinux) listening from all host
RUN /etc/init.d/postgresql start &&\
    psql --command "CREATE USER epinux WITH SUPERUSER PASSWORD 'epinux';" &&\
    createdb -O epinux epinux && psql epinux -c 'create extension postgis;' &&\
	psql epinux \
	  -f /usr/share/postgresql/9.5/contrib/postgis-2.2/legacy.sql


#ADD install_script/pgsetup.sh /tmp/pgsetup.sh
#RUN /tmp/pgsetup.sh

USER root

RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.5/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.5/main/postgresql.conf

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 5432

#USER postgres
# Set the default command to run when starting the container
#CMD ["/usr/lib/postgresql/9.5/bin/postgres", "-D", "/var/lib/postgresql/9.5/main", "-c", "config_file=/etc/postgresql/9.5/main/postgresql.conf"]
#EXPOSE 80
#CMD ["/etc/init.d/apache2", "start"]

USER epinux
