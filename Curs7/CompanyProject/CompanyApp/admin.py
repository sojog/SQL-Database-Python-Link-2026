from django.contrib import admin

# Register your models here.

from .models import Departament, Angajat

admin.site.register(Departament)
admin.site.register(Angajat)