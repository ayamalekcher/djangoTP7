from django.http import JsonResponse
from .models import Student
def list_students(request):
    return JsonResponse(list(Student.objects.values()), safe=False)
