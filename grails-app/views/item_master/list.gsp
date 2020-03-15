<%@ page import="drl2.Item_master" %>

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


    <g:set var="entityName" value="${message(default: 'Item_master')}" />
    <title>Item List</title>

</head>
<body>

    <a href="#list-Machine_summary" class="skip" tabindex="-1"><g:message default="Skip to content&hellip;"/></a>

    <h1 align="center"> &nbsp;&nbsp;&nbsp;Item List</h1>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

        <div style="float:left;">
            <g:form action="list">
                &nbsp; <i class="fa fa-pencil-square-o"></i><g:link class="btn btn-default" style="text-decoration:none" action="create">New Item Entry</g:link>
            </g:form>
        </div>

        <table id="example">
        <thead>
        <tr>
            <g:sortableColumn property="sl_no" title="Serial No." />
            <g:sortableColumn property="category" title="Category" params="${filterParams}"/>
            <g:sortableColumn property="item_name" title="Item Name" params="${filterParams}"/>
            <g:sortableColumn property="description" title="Description" params="${filterParams}"/>
            <g:sortableColumn property="model" title="Model" params="${filterParams}"/>
            <g:sortableColumn property="brand" title="Brand" params="${filterParams}"/>
            <g:sortableColumn property="unit" title="Unit" params="${filterParams}"/>
            <g:sortableColumn property="unit_price" title="Unit Price" params="${filterParams}"/>
            <g:sortableColumn property="remarks" title="Remarks" params="${filterParams}"/>
            %{--<g:sortableColumn property="update_date" title="Update Date" params="${filterParams}"/>--}%

        </tr>
        </thead>
        <tbody>
        <g:each in="${Item_masterList}" status="i" var="item_master">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><g:link action="show" controller="item_master" id="${item_master.sl_no}">${fieldValue(bean: item_master, field: "sl_no")}</g:link></td>
                <td>${fieldValue(bean: item_master, field: "category")}</td>
                <td>${fieldValue(bean: item_master, field: "item_name")}</td>
                <td>${fieldValue(bean: item_master, field: "description")}</td>
                <td>${fieldValue(bean: item_master, field: "model")}</td>
                <td>${fieldValue(bean: item_master, field: "brand")}</td>
                <td>${fieldValue(bean: item_master, field: "unit")}</td>
                <td>${fieldValue(bean: item_master, field: "unit_price")}</td>
                <td>${fieldValue(bean: item_master, field: "remarks")}</td>
                %{--<td><g:formatDate format="dd MMM yyyy" date="${item_master.update_date}"/></td>--}%
            </tr>
        </g:each>
        </tbody>
    </table>

    %{--<div class="pagination">--}%
        %{--<g:paginate controller="QueryExport_garments" action="query" total="${Export_garmentsTotal}" />--}%
    %{--</div>--}%
</body>
</html>