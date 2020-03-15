<%@ page import="drl2.Daily_sales" %>

<html>
<head lang="en">
    <meta name="layout" content="main" />
    <asset:stylesheet src="report.css"/>
    <asset:javascript src="report.js"/>

    <script type="text/javascript">
        $(document).ready(function(){
            $('#example').DataTable({
                "order": [[ 5, "desc" ]],
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
    <title>Daily Sales Report</title>

</head>
<body>

    <a href="#list-Daily_sales" class="skip" tabindex="-1"><g:message default="Skip to content&hellip;"/></a>

    <h1 align="center"> &nbsp;&nbsp;&nbsp;Daily Sales Report</h1>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

        <div style="float:left;">
            <g:form action="list">
                &nbsp; From: <g:textField class="form-control datepicker" name="fromDate" style="width: 90px; padding-left: 5px; padding-right: 5px;"/>
                To: <g:textField class="form-control datepicker" name="toDate" style="width: 90px; padding-left: 5px; padding-right: 5px;"/>
                &nbsp; <button name="save" class="btn btn-success"/><span class="glyphicon glyphicon-ok"></span></button>
                &nbsp; <g:link action="list" class="btn btn-warning" style="text-decoration:none"><span class="glyphicon glyphicon-refresh"></span></g:link>
                %{--&nbsp; <a href="#" style="text-decoration:none" onClick ="$('#example').tableExport({type:'excel',escape:'false' });"><img src="/assets/excel.png" ></a>--}%
            </g:form>
        </div>

    <table id="example">
        <thead>
        <tr>
            <g:sortableColumn property="date" title="Date" params="${filterParams}"/>
            <g:sortableColumn property="trn_no" title="Trn No." params="${filterParams}"/>
            <g:sortableColumn property="item_name" title="Item" params="${filterParams}"/>
            <g:sortableColumn property="quantity" title="Quantity" params="${filterParams}"/>
            <g:sortableColumn property="price" title="Price" params="${filterParams}"/>
            <g:sortableColumn property="sold_by" title="Sold By" params="${filterParams}"/>
            <g:sortableColumn property="notes" title="Notes" params="${filterParams}"/>
			<g:sortableColumn property="id" title="Invoice" />
        </tr>
        </thead>
        <tbody>
        <g:each in="${Daily_salesList}" status="i" var="daily_sales">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><g:formatDate format="dd MMM yyyy" date="${daily_sales.date}"/></td>
                <td>${fieldValue(bean: daily_sales, field: "trn_no")}</td>
                <td>${fieldValue(bean: daily_sales, field: "item_name")}</td>
                <td>${fieldValue(bean: daily_sales, field: "quantity")}</td>
                <td>${fieldValue(bean: daily_sales, field: "price")}</td>
                <td>${fieldValue(bean: daily_sales, field: "sold_by")}</td>
                <td>${fieldValue(bean: daily_sales, field: "notes")}</td>
				<td><g:link action="invoice" controller="daily_sales" id="${daily_sales.id}"><span class="glyphicon glyphicon-print"></span></g:link></td>
            </tr>
        </g:each>
        </tbody>
    </table>

    %{--<div class="pagination">--}%
        %{--<g:paginate controller="QueryExport_garments" action="query" total="${Export_garmentsTotal}" />--}%
    %{--</div>--}%
</body>
</html>