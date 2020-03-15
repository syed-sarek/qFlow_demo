<%@ page import="drl2.Employee" %>

<html>
<head lang="en">
	<meta name="layout" content="mymain" />
	<g:javascript library="jquery"/>
	<script src="${resource(dir: '/drl2/assets/javascripts/', file: 'jquery-2.2.0.min.js')}"></script>

	<script type="text/javascript">
        $(document).ready(function(){
            $("#filter").keyup(function(){
                // Retrieve the input field text and reset the count to zero
                var filter = $(this).val(), count = 0;
                // Loop through the comment list
                $(".srch h4").each(function(){
                    // If the list item does not contain the text phrase fade it out
                    if ($(this).text().search(new RegExp(filter, "i")) < 0) {
                        $(this).parents("#nop").fadeOut();
                        // Show the list item if the phrase matches and increase the count by 1
                    } else {
                        $(this).parents("#nop").show();
                        count++;
                    }
                });
                // Update the count
                var numberItems = count;
                $("#filter-count1").text("Result found "+count);
                e.preventDefault();
                $( this ).parents( 'li' ).toggleClass( 'is-active' );
            });
        });
	</script>

	<title>Phonebook</title>
</head>

<body>
<div style="background-image: url('${resource(dir: "images/", file: "phonebook/2233.png")}') !important; background-repeat: no-repeat; background-attachment: fixed; background-position: 0px 0px; background-size: 100% 100%;">
	<div class="container" style="padding-top:75px;padding-left:10px;padding-right:10px;padding-bottom:-20px; -webkit-box-shadow: black">
		<h1 style="color:darkgreen ;padding: 0px; top: 6px; left: 50%;margin-right: -50%;transform: translate(-50%, -50%); position:absolute;">Phonebook</h1>
		<div>
			<div class="input-group" id="inp1" style="padding: 0px; top: 53px; left: 50%;transform: translate(-50%, -50%); position:absolute; width: 20%; min-width:220px;">
				<input type="text" class="form-control" id="filter" placeholder="Search by Name...." style="height: 28px !important; border-color: #489185" onkeyup="return callfunction();">
				<span class="input-group-btn">
					<button class="btn btn-default expand" style="height: 28px !important; border-color: #489185" type="button"><span style="top: -1px !important" class = "glyphicon glyphicon-search"></span></button>
				</span>
			</div>
		</div>

		<!-- <div class = "panel-heading" style=" background-color: #489185 !important; padding: .5px !important; height: 52px !important;"> -->
		<!-- <h1 align="left" style="margin: 0.0em 0 0.3em 0 !important;"><img src="/assets/phonebook.png" height="50px" width="50px">&nbsp;Dekko Phonebook</h1> -->
		<!-- </div> -->

		<div style="padding-top:5px;padding-left:0;padding-right:0;padding-bottom:0;border:0px;height: calc(100vh - 105px);overflow-y:auto">
			<div class="container">
				<div class="panel-group srch" id="accordion">
					<g:each in="${PhonebookList}" var="employee">
						<div class="panel panel-default" id="nop">
							<div class="panel-heading">
								<h4 class="panel-title" >
									<a data-toggle="collapse" data-parent="#accordion" style="text-decoration:none; color: darkblue; font-weight: normal; font-size: 15px;" href="#${employee.id}" data-toggle="tooltip" title="Click to see details">
										${employee.name}, <font size="2" color="black">${employee.designation}</font></a>
								</h4>
							</div>
							<div id="${employee.id}" class="panel-collapse collapse">
								<div class="panel-body">
									<a style="color: darkblue !important; text-decoration: none" href="tel:${employee.phone}" data-toggle="tooltip" title="Click to call"><img src="/assets/phonebook/phone.png"> ${employee.phone}</a><br>
									<a style="color: darkblue !important; text-decoration: none" href="mailto:${employee.email}" data-toggle="tooltip" title="Click to email"><img src="/assets/phonebook/email.png"> ${employee.email}</a><br>
								</div>
							</div>
						</div>
					</g:each>
				</div>
			</div>
		</div>
	</div>
	<div width="100%">
		%{--<g:link class="create" style="position: absolute; padding: 2px; left: 20px" action="list_admin">Admin</g:link>--}%
		%{--<g:link class="create" style="position: absolute; padding: 2px; left: 30%" action="list_old" target="_blank" onclick="win(this.href,950,550)">Old Phonebook</g:link>--}%
		<a style="font-size: 12px; text-decoration:none; color: black; font-style: italic; position: absolute; padding: 2px; right: 15px" href="#">&copy; Swifter</a>
	</div>
</div>
</body>
</html>