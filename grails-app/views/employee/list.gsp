<%@ page import="drl2.Employee" %>

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
    <title>Employee Details</title>

</head>
<body>
    
    <h1 align="center">Employee Details</h1>
    </div>
    %{--<div style="float:right;">--}%
        %{--<g:link class="logout" style="text-decoration:none; color:red" controller='user' action="login"><b>Logout</b> &nbsp; </g:link>--}%
    %{--</div>--}%

    %{--<g:if test="${flash.message}">--}%
        %{--<div class="message" role="status">${flash.message}</div>--}%
    %{--</g:if>--}%


    <div class="table-responsive">
        <div style="float: left; margin-top: 0.7em; margin-left: 0.5em; position: relative; z-index: 1">
            <g:form action="list">
                &nbsp; <i class="fa fa-pencil-square-o"></i><g:link class="btn btn-default" style="text-decoration:none" action="create">New Entry</g:link>
            </g:form>
        </div>
       
        <table id="example">
        <thead>
        <tr>
            <g:sortableColumn property="id" title="Employee ID" />
            <g:sortableColumn property="name" title="Name" params="${filterParams}"/>
            <g:sortableColumn property="father" title="Father Name" params="${filterParams}"/>
            <g:sortableColumn property="nid" title="NID" params="${filterParams}"/>
            <g:sortableColumn property="phone" title="Phone" params="${filterParams}"/>
            <g:sortableColumn property="email" title="Email" params="${filterParams}"/>
            <g:sortableColumn property="designation" title="Designation" params="${filterParams}"/>
            <g:sortableColumn property="status" title="Status" params="${filterParams}"/>
        </tr>
        </thead>
        <tbody>
        <g:each in="${EmployeeList}" status="i" var="employee">
            <tr class="${(i % 2) == 0 ? 'even' : 'info'}">
                <td><g:link action="show" controller="employee" id="${employee.id}">${fieldValue(bean: employee, field: "id")}</g:link></td>
                <td>${fieldValue(bean: employee, field: "name")}</td>
                <td>${fieldValue(bean: employee, field: "father")}</td>
                <td>${fieldValue(bean: employee, field: "nid")}</td>
                <td>${fieldValue(bean: employee, field: "phone")}</td>
                <td>${fieldValue(bean: employee, field: "email")}</td>
                <td>${fieldValue(bean: employee, field: "designation")}</td>
                <td>${fieldValue(bean: employee, field: "status")}</td>
            </tr>
        </g:each>
        </tbody>
        </table>

    %{--<div class="pagination">--}%
        %{--<g:paginate controller="QueryExport_garments" action="query" total="${Export_garmentsTotal}" />--}%
    %{--</div>--}%
</body>
</html>