from django.shortcuts import render

# Create your views here.

from .models import Departament

def departaments_view(request):

    ## ORM (object relational mapper face in spate. "SELECT * FROM departament")
    all_departements = Departament.objects.all()

    return render(request, "modele.html", context = { 'departments': all_departements })