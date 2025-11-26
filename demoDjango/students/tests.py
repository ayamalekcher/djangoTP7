from django.test import TestCase
from .models import Student

class StudentTests(TestCase):

    def test_save_student(self):
        Student.objects.create(name="Charlie", address="Algeria")
        self.assertEqual(Student.objects.count(),1)

    def test_find_students(self):
        Student.objects.create(name="Charlie", address="Algeria")
        students=Student.objects.all()
        self.assertEqual(students.count(),1)
        self.assertEqual(students.first().name,"Charlie")
