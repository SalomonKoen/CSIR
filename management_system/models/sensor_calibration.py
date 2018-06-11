from django.db import models

from management_system.models import Sensor
from management_system.models.sensor_type import SensorType

class SensorCalibration(models.Model):

    sensor = models.ForeignKey(Sensor, on_delete=models.CASCADE)
    sensorType = models.ForeignKey(SensorType, on_delete=models.CASCADE)
    date = models.DateField()
    dark = models.FloatField()
    scale = models.FloatField()
    
    class Meta:
        db_table='sensor_calibrations'