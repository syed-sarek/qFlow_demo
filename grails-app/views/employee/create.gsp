<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li> <a href="javascript:history.back()"><img src="/assets/skin/back.png"/>&nbsp;&nbsp;Back</a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-employee" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.employee}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.employee}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <g:hiddenField name="id" id="id"/>
                    <h6>&#9728; Personal Information : </h6>
                    <f:field bean="employee" property="name"/>
                    <f:field bean="employee" property="father"/>
                    <f:field bean="employee" property="mother"/>
                    <f:field bean="employee" property="dob"/>
                    <f:field bean="employee" property="nid"/>
                    <h6>&#9728; Contact Information :</h6>
                    <f:field bean="employee" property="phone"/>
                    <f:field bean="employee" property="email"/>
                    <f:field bean="employee" property="address"/>
                    <h6>&#9728; Official Information :</h6>
                    <f:field bean="employee" property="designation"/>
                    <f:field bean="employee" property="salary"/>
                    <f:field bean="employee" property="status"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
