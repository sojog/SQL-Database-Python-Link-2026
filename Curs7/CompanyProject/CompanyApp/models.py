from django.db import models

# Create your models here.

# Automat Django pune un id

class Departament(models.Model):
    nume = models.CharField(max_length=20)

    def __str__(self):
        return self.nume

class Angajat(models.Model):
    nume = models.CharField(max_length=20)
    prenume = models.CharField(max_length=20)

    def __str__(self):
        return f"{self.prenume} {self.nume}"