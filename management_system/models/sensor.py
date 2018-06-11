from django.db import models

from management_system.models.sensor_type import SensorType

class Sensor(models.Model):
    name = models.CharField(max_length=128, unique=True)
    type = models.ForeignKey(SensorType, on_delete=models.CASCADE)

    def __str__(self):
        return str(self.type) + "-" + self.name

    class Meta:
        db_table = 'sensors'