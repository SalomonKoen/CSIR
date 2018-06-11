from django.db import models

class SensorType(models.Model):
    name = models.CharField(max_length=32)

    def __str__(self):
        return self.name
    
    class Meta:
        db_table='sensor_types'