<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'daily_sales.label', default: 'Daily_sales')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-daily_sales" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li> <a href="javascript:history.back()"><img src="/assets/skin/back.png"/>&nbsp;&nbsp;Back</a></li>
                <li><g:link class="list" action="index">Daily Sales Report</g:link></li>
                <li><g:link class="create" action="create">New Sales</g:link></li>
            </ul>
        </div>
        <div id="edit-daily_sales" class="content scaffold-edit" role="main">
            <h1>Edit Sales</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.daily_sales}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.daily_sales}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.daily_sales}" method="PUT">
                <g:hiddenField name="version" value="${this.daily_sales?.version}" />
                <fieldset class="form">
                    <f:all bean="daily_sales"/>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
