<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Email Sender</title>
    <script src="//cdn.ckeditor.com/4.6.2/full-all/ckeditor.js"></script>
</head>
<body>
<div id="content" role="main">
    <section class="row colset-2-its">
        <div id="create-emailsender" class="content scaffold-create" role="main">
        <g:if test="${flash.message}">
            <p style="color:limegreen;">&#10004; Email Sent Successfully</p>
        </g:if>
        <h2>Email Sender Form</h2>
        <g:form controller="emailSender" action="send"  enctype="multipart/form-data">
            <div class="fieldcontain">
                <g:textField name="address" type="email" placeholder="To" required="" style="width: 100%"/>
            </div>
            <div class="fieldcontain">
                <g:textField name="subject" placeholder="Subject" required="" style="width: 100%"/>
            </div>
            <div class="fieldcontain">
                <g:textArea name="body" rows="5" cols="80" placeholder="Your message" required="" />
            </div>
            <div class="fieldcontain">
                <input type="file" name="attachment" />
            </div>
            <br>
            <g:submitButton name="send" class="btn btn-primary" value="Send" />
        </g:form>
        </div>
    </section>
</div>
<script>
    CKEDITOR.replace('body', {
        extraPlugins: 'codesnippet'
    });
</script>
</body>
</html>