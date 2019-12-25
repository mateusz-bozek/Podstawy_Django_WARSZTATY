#sudo su - postgres
dropdb coderslab2
createdb coderslab2 -O postgres
#psql -U postgres -h 127.0.0.1 -W -d coderslab < db_dump.sql
chmod +x manage.py
python3 manage.py makemigrations
python3 manage.py migrate
echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', 'pass')" | ./manage.py shell
#echo "from django.contrib.auth import get_user_model; User.objects.create_superuser('admin', 'admin@example.com', 'pass')" | ./manage.py shell
python3 manage.py runserver