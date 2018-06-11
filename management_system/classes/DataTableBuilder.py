class DataTable:

    def __init__(self, id, classes, style, options, headerRow = None, dataRows = None, footerRow = None):
        self.id = id
        self.classes = classes
        self.options = options
        self.style = style

        self.headerRow = headerRow
        self.footerRow = footerRow
        if dataRows:
            self.dataRows = dataRows
        else:
            self.dataRows = []

    def set_header_row(self, row):
        assert isinstance(row, HeaderRow)
        self.headerRow = row

    def set_footer_row(self, row):
        assert isinstance(row, HeaderRow)
        self.footerRow = row

    def add_row(self, row):
        self.dataRows.append(row)

    def render(self):
        html = []
        html.append('<table id="%s" class="%s" style="%s">' % (self.id, self.classes, self.style))

        if self.headerRow:
            html.append('<thead>')
            html.extend(self.headerRow.render())
            html.append('</thead>')

        if self.dataRows:
            html.append('<tbody>')
            for row in self.dataRows:
                html.extend(row.render())
            html.append('</tbody>')

        if self.footerRow:
            html.append('<tfoot>')
            html.extend(self.footerRow.render())
            html.append('</tfoot>')

        html.append('</table>')

        html.append('<script>')
        html.append('$(function() { $(\'#%s\').DataTable({%s}); })' % (self.id, self.options))
        html.append('</script>')

        return '\n'.join(html)



class DataRow:

    def __init__(self, *cols, js=''):
        self.cols = cols
        self.js = js
        self.element = 'td'

    def render(self):
        html = []
        html.append('<tr>')

        linkstart = ''
        linkend = ''

        if self.js:
            linkstart = '<a href="#" onclick="%s">' % self.js
            linkend = '</a>'

        for col in self.cols:
            if not(isinstance(col, tuple)):
                col = (col,)

            value = col[0]
            colspan = ''
            if len(col) > 1:
                csp = col[1]
                colspan = ' colspan="%s"' % csp

            html.append('<%s%s>%s%s%s</%s>' % (self.element, colspan, linkstart, value, linkend, self.element))

        html.append('</tr>')

        return html

class HeaderRow(DataRow):

    def __init__(self, *cols, js=''):
        self.cols = cols
        self.js = js
        self.element = 'th'