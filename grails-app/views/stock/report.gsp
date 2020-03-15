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
                "dom": 'Bfrtip',
                "buttons": [['excel', 'print']]
            });
            document.getElementById("example").className = "";
            $('input[type=search]').addClass('form-control');
        });
    </script>

    %{--<script type="text/javascript">--}%
        %{--$(document).ready(function(){--}%
            %{--$('.img-zoom').hover(function() {--}%
                %{--$(this).addClass('transition');--}%

            %{--}, function() {--}%
                %{--$(this).removeClass('transition');--}%
            %{--});--}%
        %{--});--}%
    %{--</script>--}%

    <script type="text/javascript">
        $(function() {
            $('input[name="fromDate"]').daterangepicker({
                singleDatePicker: true,
                showDropdowns: true,
                locale: {
                    format: "'"+'DD-MMM-YY'+"'"
                }
            });
            $('input[name="toDate"]').daterangepicker({
                singleDatePicker: true,
                showDropdowns: true,
                locale: {
                    format: "'"+'DD-MMM-YY'+"'"
                }
            });
        });
    </script>

    <g:set var="entityName" value="${message(default: 'Daily_sales')}" />
    <title>Stock Report</title>

</head>
<body>

    <a href="#list-Stock" class="skip" tabindex="-1"><g:message default="Skip to content&hellip;"/></a>

    <h1 align="center"> &nbsp;&nbsp;&nbsp;Stock Report</h1>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <table id="example">
        <thead>
        <tr>
            <g:sortableColumn property="id" title="ID" />
            <g:sortableColumn property="item" title="Item" params="${filterParams}"/>
            <g:sortableColumn property="stock_quantity" title="Stock Quantity" params="${filterParams}"/>
        </tr>
        </thead>
        <tbody>
        <g:each in="${StockList}" status="i" var="stock">
            <tr class="${(i % 2) == 0 ? 'even' : 'info'}">
                <td>${fieldValue(bean: stock, field: "id")}</td>
                <td>${fieldValue(bean: stock, field: "item")}</td>
                <td>${fieldValue(bean: stock, field: "stock_quantity")}</td>
            </tr>
        </g:each>
        </tbody>
    </table>

    %{--<div class="pagination">--}%
        %{--<g:paginate controller="QueryExport_garments" action="query" total="${Export_garmentsTotal}" />--}%
    %{--</div>--}%
</body>
</html>