
<%@ page import="itworkorders.WorkGroup" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'workGroup.label', default: 'WorkGroup')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-workGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-workGroup" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list workGroup">
			
				<g:if test="${workGroupInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="workGroup.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${workGroupInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${workGroupInstance?.queues}">
				<li class="fieldcontain">
					<span id="queues-label" class="property-label"><g:message code="workGroup.queues.label" default="Queues" /></span>
					
						<g:each in="${workGroupInstance.queues}" var="q">
						<span class="property-value" aria-labelledby="queues-label"><g:link controller="queue" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${workGroupInstance?.tickets}">
				<li class="fieldcontain">
					<span id="tickets-label" class="property-label"><g:message code="workGroup.tickets.label" default="Tickets" /></span>
					
						<g:each in="${workGroupInstance.tickets}" var="t">
						<span class="property-value" aria-labelledby="tickets-label"><g:link controller="ticket" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${workGroupInstance?.users}">
				<li class="fieldcontain">
					<span id="users-label" class="property-label"><g:message code="workGroup.users.label" default="Users" /></span>
					
						<g:each in="${workGroupInstance.users}" var="u">
						<span class="property-value" aria-labelledby="users-label"><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:workGroupInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${workGroupInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
