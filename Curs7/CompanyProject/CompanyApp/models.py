from django.db import models

# Create your models here.

# Automat Django pune un id

# CREATE TABLE IF NOT EXISTS departament
# (id int unique auto_increment primary key,
# nume char(20),
# manager_id int);
 

class Departament(models.Model):
    nume = models.CharField(max_length=20)
    manager_id =  models.IntegerField(null=True)
    # manager = models.ForeignKey('Angajat', on_delete=models.SET_NULL, null=True, blank=True, related_name="departamente_conduse")

    def __str__(self):
        return self.nume

# CREATE TABLE IF NOT EXISTS angajat
# (id int unique auto_increment primary key,
# nume char(20),
# prenume char(20),
# departament_id int,
# manager_id int ,
# salariu int,
# angajare date,
# vechime date,
# INDEX (departament_id),
# -- 1. Se definesc două chei străine în tabela angajat: (a) departament_id pentru id din tabela departament; (b) manager_id - o pentru id din tabela angajat
# FOREIGN KEY (departament_id) REFERENCES departament(id),
# FOREIGN KEY(manager_id) REFERENCES angajat(id));


class Angajat(models.Model):
    nume = models.CharField(max_length=20)
    prenume = models.CharField(max_length=20)
    
    departament =  models.ForeignKey('Departament', on_delete=models.SET_NULL, null=True, blank=True, related_name="angajati")

    manager =  models.ForeignKey('Angajat', on_delete=models.SET_NULL, null=True, blank=True, related_name="subordonati")
    
    salariu = models.IntegerField(null=True)
    angajare = models.DateField(null=True)
    vechime =  models.DateField(null=True)

    def __str__(self):
        return f"{self.prenume} {self.nume}"