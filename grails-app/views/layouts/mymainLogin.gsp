<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Sarek"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    <script>
    $(document).ready(function(){

        function hideDiv() {
            document.getElementById('myNav').style.display = "none";
        }
    });
    </script>
    <g:layoutHead/>
	<link rel="shortcut icon" href="/assets/erp.ico">
</head>
<body>

    <div class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="container">
            <div class="navbar-header" style="width: 110%; ">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNav">
                    <span class="sr-only"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <ul class="navbar-right">
                <div class="dropdown-menu" role = "menu" style="border-color: #0c0c0c" id="myNav" >
                    <li><g:link style="color:blue !important; font-size: 15px !important;" action="module" controller="User">Modules</g:link></li>
                    <li role="separator" class="divider"></li>
                    <li><a style="color:red !important; font-size: 15px !important;" href="${createLink(action: 'logout', controller: 'User' )}">Log Out</a></li>
                </div>
                </ul>
                <a class="navbar-brand" href="/#">
                    <i class="fa grails-icon">
                        <asset:image src="erp.ico"/>
                    </i> Swifter
                </a>
            </div>
        </div>
    </div>

    <g:layoutBody/>

    <div class="footer navbar-fixed-bottom" align="right" style="line-height: 15px !important;" role="contentinfo"><a style="text-decoration:none; color:white;" href="https://www.facebook.com/syed.sarek">Developed by: Syed Abdul Sarek</a>&nbsp;  &nbsp; </div>

    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

</body>
</html>
