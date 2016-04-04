
<%@ page import="itworkorders.Reply" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reply.label', default: 'Reply')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-reply" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-reply" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list reply">
			
				<g:if test="${replyInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="reply.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${replyInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${replyInstance?.reply}">
				<li class="fieldcontain">
					<span id="reply-label" class="property-label"><g:message code="reply.reply.label" default="Reply" /></span>
					
						<span class="property-value" aria-labelledby="reply-label"><g:fieldValue bean="${replyInstance}" field="reply"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${replyInstance?.ticket}">
				<li class="fieldcontain">
					<span id="ticket-label" class="property-label"><g:message code="reply.ticket.label" default="Ticket" /></span>
					
						<span class="property-value" aria-labelledby="ticket-label"><g:link controller="ticket" action="show" id="${replyInstance?.ticket?.id}">${replyInstance?.ticket?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${replyInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="reply.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${replyInstance}" field="user"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:replyInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${replyInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
