from django.shortcuts import render

from management_system.classes.DataTableBuilder import DataTable, HeaderRow, DataRow
from management_system.models import Mission

def render_generic_search_page(request, title, data_table):

    return render(request, 'generic/generic_search_page.html', { 'title': title, 'searchDataTable' : data_table })