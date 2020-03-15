<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="mymain" />
    <title>User Login</title>
    <g:javascript library="jquery" plugin="jquery"/>
    <script>
        function showDiv() {
            document.getElementById('welcomeDiv').style.display = "block";
        }
        function hideDiv() {
            document.getElementById('byeDiv').style.display = "none";
        }
    </script>
</head>
<body>
<div style="background-position: center top; background-size: 100% 100%; background-image: url('${resource(dir: 'images/', file: 'login.jpg')}') !important; height: 100vh; width: 100vw">
    <div align="center" style="position:fixed; bottom: 80%;left: 50%;-webkit-transform: translate(-50%, -50%);transform: translate(-50%, -50%);">
        <a style="color: white !important; text-decoration:none; font-size: 24px !important;">Swifter</a>
    </div>
    <div id="byeDiv" class="content scaffold-create" style="position:fixed; top: 50%;left: 50%;-webkit-transform: translate(-50%, -50%);transform: translate(-50%, -50%);">
        <br>
        <g:form action="doLogin" method="post">
            <div class="dialog" align="center">
                <div style="width:300px; background-color: rgba(245, 245, 245, 0.4);" class="well">
                        <h1 style="color: white">Log in to continue</h1><br>
                        <input class="form-control" style="width: 250px; background-color: white; border-color: #ccc" id="email" required type='text' name='email' placeholder="Email" value='${user?.email}'/><br><br>
                        <input class="form-control" style="width: 250px; background-color: white; border-color: #ccc" id="password" required type='password' name='password' placeholder="Password" value='${user?.password}'/><br>
                         <g:if test="${flash.error}">
                            <div class="message" role="status" style="color: whitesmoke; font-size: 12px">${flash.error}</div>
                        </g:if>
                        <br><input class="btn btn-primary" type="submit" style="width: 250px" value="Login"> <br><br>
                        %{--<input type="button" name="answer" value="Change Password" onclick="showDiv()" />--}%
                        <a role="button" name="answer" onclick="showDiv(); hideDiv()"  style="text-decoration:none; color: blue">Change Password</a>
                </div>
            </div>
        </g:form>
    </div>

    <div id="welcomeDiv"  style="display:none;" class="content scaffold-create" align="center">
        <br>
        <g:form action='updatePassword' method="post">
            <div style="width:280px; position:fixed; top: 50%;left: 50%;-webkit-transform: translate(-50%, -50%);transform: translate(-50%, -50%);"> %{--add class="panel panel-default" here for panel--}%
                <div style="width:300px; background-color: rgba(245, 245, 245, 0.4);" class="well"><br>
                    <g:textField id="email" type='text' name='email' class='form-control' placeholder="Email" style="width: 250px"/>
                    <br>
                    <br>
                    <g:passwordField name='password_current' placeholder="Current Password" class='form-control' style="width: 250px"/>
                    <br>
                    <br>
                    <input type="password" class="form-control" name="passwordNew" placeholder="New Password" style="width: 250px">
                    <br>
                    <br>
                    <input class="btn btn-info" type="submit" style="width: 250px" value="Submit"><br><br>
                </div></div>
        </g:form>
    </div>
    <div class="navbar-fixed-bottom" align="right" role="contentinfo"><a style="text-decoration:none; font-size: 11px; color:whitesmoke" href="https://www.facebook.com/syed.sarek">Developed by: Syed Abdul Sarek</a>&nbsp;  &nbsp; </div>
</div>
</body>
</html>
