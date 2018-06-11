from django.db import models

class Glider(models.Model):
    name = models.CharField(max_length=32, unique=True)

    def __str__(self):
        return self.name

    class Meta:
        db_table='gliders'