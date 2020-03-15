<%@ page import="drl2.Customer" %>

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
    <title>Customer List</title>

</head>
<body>

    <a href="#list-Machine_summary" class="skip" tabindex="-1"><g:message default="Skip to content&hellip;"/></a>

    <h1 align="center"> &nbsp;&nbsp;&nbsp;Customer List</h1>

    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

        <div style="float:left;">
            <g:form action="list">
                &nbsp; <i class="fa fa-pencil-square-o"></i><g:link class="btn btn-default" style="text-decoration:none" action="create">New Customer Entry</g:link>
                %{--&nbsp; <a href="#" style="text-decoration:none" onClick ="$('#example').tableExport({type:'excel',escape:'false' });"><img src="/assets/excel.png" ></a>--}%
            </g:form>
        </div>

        <table id="example">
        <thead>
        <tr>
            <g:sortableColumn property="id" title="Serial No." />
            <g:sortableColumn property="name" title="Name" params="${filterParams}"/>
            <g:sortableColumn property="phone" title="Phone" params="${filterParams}"/>
            <g:sortableColumn property="email" title="Email" params="${filterParams}"/>
            <g:sortableColumn property="address" title="Address" params="${filterParams}"/>
            <g:sortableColumn property="country" title="Country" params="${filterParams}"/>
            <g:sortableColumn property="status" title="Status" params="${filterParams}"/>
        </tr>
        </thead>
        <tbody>
        <g:each in="${CustomerList}" status="i" var="customer">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td><g:link action="show" controller="customer" id="${customer.id}">${fieldValue(bean: customer, field: "id")}</g:link></td>
                 <td>${fieldValue(bean: customer, field: "name")}</td>
                 <td>${fieldValue(bean: customer, field: "phone")}</td>
                <td>${fieldValue(bean: customer, field: "email")}</td>
                <td>${fieldValue(bean: customer, field: "address")}</td>
                <td>${fieldValue(bean: customer, field: "country")}</td>
                <td>${fieldValue(bean: customer, field: "status")}</td
            </tr>
        </g:each>
        </tbody>
    </table>

    %{--<div class="pagination">--}%
        %{--<g:paginate controller="QueryExport_garments" action="query" total="${Export_garmentsTotal}" />--}%
    %{--</div>--}%
</body>
</html>