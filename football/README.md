

Chcemy załadować tabele teams i games z jakiegoś dumpa:

`psql -U postgres -h 127.0.0.1 -W -d coderslab2 < football.sql`


Tworzymy migrację:
`./manage.py makemigrations`


Z racji, że tabele już istnieją, to tylko udajemy, że je tworzymy:
`
./manage.py migrate --fake football
`