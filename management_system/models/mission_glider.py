from django.db import models

from management_system.models import Mission, Glider
from management_system.models.sensor import Sensor

class MissionGlider(models.Model):
    mission = models.ForeignKey(Mission, on_delete=models.CASCADE)
    glider = models.ForeignKey(Glider, on_delete=models.CASCADE)
    startDate = models.DateField(null=True)
    endDate = models.DateField(null=True)
    dives = models.IntegerField(default=0)
    sensors = models.ManyToManyField(Sensor, db_table='mission_glider_sensors')

    class Meta:
        db_table = 'mission_gliders'
