<%@ page import="drl2.Stock" %>

<html>
<head lang="en">
    <meta name="layout" content="main" />
    <asset:stylesheet src="report.css"/>
    <asset:javascript src="report.js"/>

    <script type="text/javascript">
        $(document).ready(function(){
            $('#example').DataTable({
                "order": [[ 1, "desc" ]],
                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                "deferRender": true,
                "dom": 'flrtip',
                "buttons": [['excel', 'print']]
            });
            document.getElementById("example").className = "";
            $('input[type=search]').addClass('form-control');
        });
    </script>

    <g:set var="entityName" value="${message(default: 'Daily_sales')}" />
    <title>Stock Maintenance</title>

</head>
<body>

    <a class="skip" tabindex="-1"><g:message default="Skip to content&hellip;"/></a>

    <h1 align="center"> &nbsp;&nbsp;&nbsp;Stock Maintenance</h1>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <table id="example">
        <thead>
        <tr>
            <g:sortableColumn property="id" title="ID" />
            <g:sortableColumn property="item" title="Item" params="${filterParams}"/>
            <g:sortableColumn property="stock_quantity" title="Stock Quantity" params="${filterParams}"/>
            <g:sortableColumn property="action" title="Action" params="${filterParams}"/>
        </tr>
        </thead>
        <tbody>
        <g:each in="${StockList}" status="i" var="stock">
            <tr class="${(i % 2) == 0 ? 'even' : 'info'}">
                <td><g:link action="show" controller="stock" id="${stock.id}">${fieldValue(bean: stock, field: "id")}</g:link></td>
                <td>${fieldValue(bean: stock, field: "item")}</td>
                <td>${fieldValue(bean: stock, field: "stock_quantity")}</td>
                <td>
                    <g:form resource="${this.stock}" method="DELETE">
                        <g:link id="${stock.id}" class="btn btn-warning" action="edit" resource="${this.stock}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        <g:actionSubmit id="${stock.id}" class="btn btn-danger" value="Delete" onclick="return confirm('Are you sure???')" />
                    </g:form>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>

    %{--<div class="pagination">--}%
        %{--<g:paginate controller="QueryExport_garments" action="query" total="${Export_garmentsTotal}" />--}%
    %{--</div>--}%
</body>
</html>