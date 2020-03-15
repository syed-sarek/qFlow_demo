<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'daily_sales.label', default: 'Daily_sales')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-daily_sales" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li> <a href="javascript:history.back()"><img src="/assets/skin/back.png"/>&nbsp;&nbsp;Back</a></li>
                <li><g:link class="list" action="index">Daily Sales Report</g:link></li>
                <li><g:link class="create" action="create">New Sales</g:link></li>
            </ul>
        </div>
        <div id="show-daily_sales" class="content scaffold-show" role="main">
            <h1>Sales Details</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:display bean="daily_sales" />
            <g:form resource="${this.daily_sales}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.daily_sales}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
