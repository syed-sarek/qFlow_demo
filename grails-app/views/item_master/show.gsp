<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'item_master.label', default: 'Item_master')}" />
        <title>Item Details</title>
    </head>
    <body>
        <a href="#show-machine_summary" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li> <a href="javascript:history.back()"><img src="/assets/skin/back.png"/>&nbsp;&nbsp;Back</a></li>
                <li><g:link class="list" action="list">Item List</g:link></li>
                <li><g:link class="create" action="create">New Item Entry</g:link></li>
            </ul>
        </div>
        <div id="show-machine_summary" class="content scaffold-show" role="main">
            <h1>Item Details</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:display bean="item_master" />
            <g:form resource="${this.item_master}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" controller="item_master" id="${item_master.sl_no}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
