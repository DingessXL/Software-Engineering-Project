<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>

	%{--Load in JQuery Masks--}%
	<g:javascript src="jquery.mask.js" />

</head>
<body>
<a href="#create-ticket" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

%{-- Render Nav Template --}%
<g:render template="/grails-app/views/nav/nav" />


<div id="create-ticket" class="content scaffold-create" role="main">

	%{--Use simple h1 tag oppesed to g:message which was causeing issues--}%
	<h1>Open New Ticket</h1>

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
	<g:form url="[resource:ticketInstance, action:'save']" >
		<fieldset class="form">
			<g:render template="createForm"/>
		</fieldset>
		<fieldset class="buttons">
			<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
		</fieldset>
	</g:form>
</div>
%{--Add mask to phone number--}%
<g:javascript>$("#phoneNumber").mask("(000)-000-0000")</g:javascript>
</body>
</html>