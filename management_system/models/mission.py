from django.db import models

from .glider import Glider

class Mission(models.Model):
    name = models.CharField(max_length=128)
    startDate = models.DateField()
    endDate = models.DateField()
    gliders = models.ManyToManyField(Glider, through='MissionGlider')

    def get_display_start_date(self):
        return self.startDate.strftime('%d-%m-%Y')

    def get_display_end_date(self):
        return self.endDate.strftime('%d-%m-%Y')

    class Meta:
        db_table='missions'