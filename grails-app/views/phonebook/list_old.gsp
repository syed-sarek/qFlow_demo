<%@ page import="drl2.Phonebook" %>

<html>
<head lang="en">
    <meta name="layout" content="main" />
    <asset:stylesheet src="datatables.min.css"/>
    <asset:stylesheet src="jquery.dataTables.min.css"/>
    <asset:stylesheet src="fixedHeader.dataTables.min.css"/>
    <g:javascript library="jquery" plugin="jquery"/>
    <script src="${resource(dir: '/drl2/assets/javascripts/', file: 'jquery-2.2.0.min.js')}"></script>

    %{--For Table--}%
    <script src="${resource(dir: '/drl2/assets/javascripts/', file: 'jquery.dataTables.min.js')}"></script>
    <script src="${resource(dir: '/drl2/assets/javascripts/', file: 'dataTables.fixedHeader.min.js')}"></script>
    %{--For Table--}%

    %{--For Export--}%

    <script type="text/javascript">
        $.noConflict(true);
        $(document).ready(function(){
            $('#example').DataTable( {
//                "aaSorting" : []
                dom: 'Brti',
				fixedHeader: true,
                paging: false
//                scrollY: 200
//                buttons: [Bfrtip
//                    'copy', 'csv', 'excel', 'pdf', 'print'
//                ]
//                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
//                "order": [[ 8, "desc" ]]
            });
            var dataTable = $('#example').DataTable();

            $("#filterbox").keyup(function() {
                dataTable.search(this.value).draw();
            });
            document.getElementById("example").className = "";
            $('input[type=search]').addClass('form-control ');
        });
    </script>

    <title>Employee Details</title>
</head>
<body>
<div class="container" style="padding: 5px; -webkit-box-shadow: black">
    <div class="panel panel-primary" style="margin-bottom: 0px !important">
		<div class = "panel-heading" style=" background-color: #489185 !important; padding: .5px !important; height: 52px !important;">
			<h1>&nbsp;Employee Details</h1>
		</div>
		%{--<div style="float:right;">--}%
		%{--<g:link class="logout" style="text-decoration:none; color:red" controller='user' action="login"><b>Logout</b> &nbsp; </g:link>--}%
		%{--</div>--}%

		%{--<g:if test="${flash.message}">--}%
		%{--<div class="message" role="status">${flash.message}</div>--}%
		%{--</g:if>--}%

		<div class="panel-body" style="padding-top:5px;padding-left:0;padding-right:0;padding-bottom:0;border:0px;height: calc(100vh - 115px);overflow-y:auto">
			<div class="table-responsive">
				%{--<div style="overflow: hidden;">--}%
					%{--<div style="float: right; width: 70px; padding: 15px;">--}%
						%{--<a href="#" style="text-decoration:none" onClick ="$('#example').tableExport({type:'excel',escape:'true' });"><img src="/assets/excel.png" ></a>--}%
					%{--</div>--}%
					<div class="input-group" style="padding: 10px; top: 55px; right:5px; position:absolute; width: 30%; min-width:220px;">
						<input id="filterbox" type="text" class="form-control" placeholder="Search for...">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button"><span class = "glyphicon glyphicon-search"></span></button>
						</span>
					</div>
				%{--</div>--}%

				<table id="example" >
					<thead>
					<tr>
						%{--<g:sortableColumn property="emp_id" title="Employee ID" />--}%
						<g:sortableColumn property="name" title="Name" params="${filterParams}"/>
						<g:sortableColumn property="designation" title="Designation" params="${filterParams}"/>
						<g:sortableColumn property="department" title="Department" params="${filterParams}"/>
						<g:sortableColumn property="phone" title="&#9742; Phone" params="${filterParams}"/>
						<g:sortableColumn property="email" title="&#9993; Email" params="${filterParams}"/>
						<g:sortableColumn property="pabx" title="PABX" params="${filterParams}"/>
						<g:sortableColumn property="unit" title="Unit" params="${filterParams}"/>
						%{--<g:sortableColumn property="status" title="Status" params="${filterParams}"/>--}%
						%{--<g:sortableColumn property="update_date" title="Update Date" params="${filterParams}"/>--}%
					</tr>
					</thead>
					<tbody>
					<g:each in="${PhonebookList}" status="i" var="phonebook">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							%{--<td>${fieldValue(bean: phonebook, field: "emp_id")}</td>--}%
							<td>${fieldValue(bean: phonebook, field: "name")}</td>
							<td>${fieldValue(bean: phonebook, field: "designation")}</td>
							<td>${fieldValue(bean: phonebook, field: "department")}</td>
							<td width="50px !important"><g:link style="color: darkblue !important; text-decoration: none" id="${phonebook.phone}" url="tel:${phonebook.phone}">${fieldValue(bean: phonebook, field: "phone")}</g:link></td>
							<td><g:link style="color: darkblue !important; text-decoration: none" id="${phonebook.email}" url="mailto:${phonebook.email}">${fieldValue(bean: phonebook, field: "email")}</g:link></td>
							<td>${fieldValue(bean: phonebook, field: "pabx")}</td>
							<td>${fieldValue(bean: phonebook, field: "unit")}</td>
							%{--<td>${fieldValue(bean: phonebook, field: "status")}</td>--}%
							%{--<td><g:formatDate format="dd MMM yyyy" date="${item_master.update_date}"/></td>--}%
						</tr>
					</g:each>
					</tbody>
				</table>
				<div align="right">
					<g:link class="create" action="list_admin">Admin</g:link>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a style="font-size: 12px; text-decoration:none; color: darkblue; font-style: italic;" href="#">&copy; Dekko Group IT</a>&nbsp;&nbsp;
				</div>
			</div>
		</div>
	</div>
</div>

%{--<div class="pagination">--}%
%{--<g:paginate controller="QueryExport_garments" action="query" total="${Export_garmentsTotal}" />--}%
%{--</div>--}%
</body>
</html>