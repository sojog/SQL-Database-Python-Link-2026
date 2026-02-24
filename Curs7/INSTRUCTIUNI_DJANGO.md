Dacă django nu este instalat
# pip install django

Creare unui proiect django numit ex: CompanyProject
# python -m django startproject numeleproiectului    
sau dacă este vizibil django-admin
# django-admin startproject numeleproiectului

Intrare in folderul proiectului respectiv
# cd numeleproiectului

Verficare server corect:
# ls           -> listează ceea ce se află în folder

Rularea serverului -> terminalul acesta rămâne mereu deschis
# python manage.py runserver

Deschidererea unui nou terminal
# VSCode -> Terminal -> New Terminal

Crearea unei noi aplicații (un proiect are mai multe aplicații)
1. Navigez la nivelul lui manage.py
# cd numeleproiectului
2. Verific dacă sunt în locația potrivită (trebuie să văd "manage.py")
# ls
3. Crearea unei noi aplicații
# python manage.py startapp CompanyApp
4. Instalarea aplicație -> 
    -> In proiect -> in settings.py  -> în INSTALLED_APPS -> adaug 'CompanyApp' (numele aplicației între ghilimele)


Pentru a crea o migrare (în baza de date: orice ce fel de actiune de tipul DCL)

# python manage.py makemigrations
# python manage.py migrate 


Pentru a crea un superuser
# python manage.py createsuperuser
    1. Username -> admin
    2. Email address -> admin@admin.com
    3. Password -> admin
    4. Password (again) -> admin
    5. Bypass password validation and create user anyway? -> y


Pentru a crea un nou model:
1. Intr-o aplicatie din proiect se creaza modulul (o clasa de oop) -> este in models.py
ex:
class Departament(models.Model):
    nume = models.CharField(max_length=20)

2. Modelul trebui adus in baza de date
# python manage.py makemigrations
# python manage.py migrate 


Pentru a înregistra un model în admin (pentru a-l modifica în adminȘ adaugare, editare etc)

1. În aplicatia in care se afla modelul in fisierul admin
2. Instructiunile sunt:
   # from .models import NumeleModelului
   # admin.site.register(NumeleModelului)





Pentru a înlocui default SQLite3 cu MySQL

1. Instalare mysqlclient
# pip install mysqlclient
Alternativ (MacOS)
# pip install PyMySQL
        si in __init__ din proiect (doar daca nu merge mysqlclient):
        # import pymysql
        # pymysql.install_as_MySQLdb()

        


2. Merg în settings.py din proiect
   ->Înlocuiesc datele pentru SQLite3 cu cele noi
    În loc de:

        DATABASES = {
            'default': {
                'ENGINE': 'django.db.backends.sqlite3',
                'NAME': BASE_DIR / 'db.sqlite3',
            }
        }

CU

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.mysql",
        "NAME": "my_django_database",
        "USER": "my_django_user",
        "PASSWORD": "my_django_password",
        "HOST": "127.0.0.1",
        "PORT": "3306",
    }
}

Explicatie:
# "ENGINE": "django.db.backends.mysql" -> engine de mysql

# "NAME": "mydatabase" -> baza de date la care am acces

        "NAME": "my_django_database",
        "USER": "my_django_user",
        "PASSWORD": "my_django_password",

-> In MySQL ar fi trebuit să am ceva similar
    -> CREATE DATABASE IF NOT EXISTS my_django_database;
       CREATE USER 'my_django_user'@'127.0.0.1' IDENTIFIED BY 'my_django_password';
       GRANT ALL PRIVILEGES ON my_django_database.* TO 'my_django_user'@'127.0.0.1';

# "HOST": "127.0.0.1" -> database local
# "PORT": "3306" -> pt MySQL este 3306

După conectarea la noua baza de date:
# python manage.py makemigrations
# python manage.py migrate 