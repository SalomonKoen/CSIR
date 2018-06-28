from _pydecimal import Decimal

from django.shortcuts import render
from management_system.classes.DataTableBuilder import *
from management_system.models import Mission, MissionGlider, SensorCalibration
from .generic import render_generic_search_page

def render_missions_search(request):
    dataTable = DataTable('missions', 'table table-striped table-sm', '', '"order":[[1,\'asc\']]')
    dataTable.set_header_row(HeaderRow('Name', 'Start Date', 'End Date'))

    for mission in Mission.objects.all():
        dataTable.add_row(DataRow(mission.name,
                                  '<span hidden>%s</span>%s' % (mission.startDate.strftime('%Y%m%d'), mission.startDate.strftime('%d-%m-%Y')),
                                  '<span hidden>%s</span>%s' % (mission.endDate.strftime('%Y%m%d'), mission.endDate.strftime('%d-%m-%Y')),
                                  js='window.location=\'/mission/view?id=%s\';' % mission.id))

    return render_generic_search_page(request, 'Missions', dataTable)

def render_mission(request):
    mission = Mission.objects.get(id=request.GET['id'])
    dataTable = DataTable('gliders', 'table table-striped table-sm', '', '')
    dataTable.set_header_row(HeaderRow('Name', 'Dives', 'Deployed Date', 'Recovery Date'))

    for glider in mission.missionglider_set.all():
        dataTable.add_row(DataRow(glider.glider.name,
                                  glider.dives,
                                  '<span hidden>%s</span>%s' % (glider.startDate.strftime('%Y%m%d'), glider.startDate.strftime('%d-%m-%Y')),
                                  '<span hidden>%s</span>%s' % (glider.endDate.strftime('%Y%m%d'), glider.endDate.strftime('%d-%m-%Y')),
                                  js='window.open(\'/mission/glidermission/view?id=%s\',\'Glider Mission\',\'width=1024,height=800\');' % glider.id))

    return render(request, 'mission/view.html', { 'mission' : mission, 'datatable' : dataTable })

def render_glider_mission(request):
    gliderMission = MissionGlider.objects.get(id=request.GET['id'])
    mission = gliderMission.mission
    glider = gliderMission.glider
    sensors = gliderMission.sensors.all()
    dataTable = DataTable('sensors', 'table table-striped table-sm', '', '')
    dataTable.set_header_row(HeaderRow('Sensor', 'Calibration Type', 'Dark', 'Scale'))

    for sensor in sensors:
        sensorTypes = SensorCalibration.objects.filter(sensor_id=sensor.id).values_list('sensorType_id', flat=True).distinct()
        calibType = []
        dark = []
        scale = []

        for sensorType in sensorTypes:
            calib = SensorCalibration.objects.filter(sensorType_id=sensorType, sensor_id=sensor.id, date__lte=gliderMission.startDate).order_by('-date')
            if calib:
                calib = calib[0]
                calibType.append(calib.sensorType.name)
                dark.append(float_to_str(calib.dark))
                scale.append(float_to_str(calib.scale))

        dataTable.add_row(DataRow(sensor, '<br>'.join(calibType), '<br>'.join(dark), '<br>'.join(scale)))

    return render(request, 'mission/glidermission/view.html', { 'glider': glider, 'mission': mission, 'datatable': dataTable })

import decimal
ctx = decimal.Context()
ctx.prec = 20

def float_to_str(f):

    d1 = ctx.create_decimal(repr(f))
    return format(d1, 'f')