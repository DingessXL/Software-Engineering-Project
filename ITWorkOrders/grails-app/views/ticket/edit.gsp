<%@ page import="itworkorders.Ticket" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
	<title><g:message code="default.edit.label" args="[entityName]" /></title>

	%{--Load in JQuery Masks--}%
	<g:javascript src="jquery.mask.js" />

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
			<g:render template="form"/>
		</fieldset>
		<fieldset class="buttons">

			<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />

			<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_TECH">
				<g:link class="edit" action="editTech" resource="${ticketInstance}"><g:message code="Assign Technician" default="Assign Technician" /></g:link>
				<g:link class="edit" action="editWorkgroup" resource="${ticketInstance}"><g:message code="Switch Workgroup" default="Switch Workgroup" /></g:link>
			</sec:ifAnyGranted>
			<!-- OPEN / CLOSE TICKET BUTTONS -->

			<g:if test="${ticketInstance?.status.equals("Open")}">
				<g:link controller="reply" action="createCloseReply" params="['ticket.id': ticketInstance?.id]">${message(code: 'Close Ticket', args: [message(code: 'reply.label', default: 'Close Ticket')])}</g:link>

				<!--<g:actionSubmit class="save" action="close" value="Close Ticket" /> -->
			</g:if>
			<g:if test="${ticketInstance?.status.equals("Closed")}">
				<g:actionSubmit class="save" action="open" value="Reopen Ticket" />
			</g:if>

		</fieldset>
	</g:form>
</div>

%{--Add mask to phone number--}%
<g:javascript>$("#phoneNumber").mask("(000)-000-0000")</g:javascript>
</body>
</body>
</html>
