from datetime import datetime

from django.db.models import Count, Sum, Max
from django.shortcuts import render

from management_system.classes.DataTableBuilder import DataTable, HeaderRow, DataRow
from management_system.models import Mission, Glider, MissionGlider
from .generic import render_generic_search_page

def render_gliders_search(request):
    dataTable = DataTable('gliders', 'table table-striped table-sm', '', '"order":[[3,\'desc\']]')
    dataTable.set_header_row(HeaderRow('Name', 'Total Deploys', 'Total Dives', 'Last Used'))
    totalDeploys = MissionGlider.objects.values('glider_id').annotate(totalDeploys=Count('id'))
    totalDives = MissionGlider.objects.values('glider_id').annotate(totalDives=Sum('dives'))
    lastUsed = MissionGlider.objects.values('glider_id').annotate(lastUsed=Max('endDate'))

    for glider in Glider.objects.all():
        dataTable.add_row(DataRow(glider.name,
                                  totalDeploys.get(glider_id=glider.id)['totalDeploys'],
                                  totalDives.get(glider_id=glider.id)['totalDives'],
                                  lastUsed.get(glider_id=glider.id)['lastUsed']))

    return render(request, 'glider/search.html', { 'title': 'Gliders', 'searchDataTable': dataTable })