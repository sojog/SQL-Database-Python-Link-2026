from django.shortcuts import render

from .models import Note

# Create your views here.

def note_view(request):

    note_list = Note.objects.all()

    context = {
        'note' :  note_list
    }

    return render(request, 'notes.html', context )