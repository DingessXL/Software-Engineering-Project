<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<a href="#edit-ticket" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

%{-- Render Nav Template --}%
<g:render template="/grails-app/views/nav/nav" />



<div id="edit-ticket" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${ticketInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${ticketInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[resource:ticketInstance, action:'update']" method="PUT" >
        <g:hiddenField name="version" value="${ticketInstance?.version}" />
        <fieldset class="form">
            <g:render template="formEditWorkgroup"/>
        </fieldset>
        <fieldset class="buttons">
            <g:actionSubmit class="save" action="assignWorkgroup" value="${message(code: 'Switch Workgroup', default: 'Switch Workgroup')}" />

        </fieldset>
    </g:form>
</div>
</body>
</html>
