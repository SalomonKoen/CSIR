from django.contrib import admin

# Register your models here.
from management_system.models import *

admin.site.register(Glider)
admin.site.register(Mission)
admin.site.register(MissionGlider)
admin.site.register(Sensor)
admin.site.register(SensorCalibration)
admin.site.register(SensorType)