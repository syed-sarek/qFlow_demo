<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'item_master.label', default: 'Item_master')}" />
        <title>Update Item Information</title>
    </head>
    <body>
        <a href="#edit-machine_summary" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li> <a href="javascript:history.back()"><img src="/assets/skin/back.png"/>&nbsp;&nbsp;Back</a></li>
                <li><g:link class="list" action="index">Item List</g:link></li>
                <li><g:link class="create" action="create">Item Entry</g:link></li>
            </ul>
        </div>
        <div id="edit-machine_summary" class="content scaffold-edit" role="main">
            <h1>Update Item Information</h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.item_master}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.item_master}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form resource="${this.item_master}" method="PUT">
                <g:hiddenField name="version" id="${item_master.sl_no}" />
                <fieldset class="form">
                    <f:all bean="item_master" id="${item_master.sl_no}"/>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
