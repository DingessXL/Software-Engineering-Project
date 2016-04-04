
<%@ page import="itworkorders.Priority" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'priority.label', default: 'Priority')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-priority" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-priority" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list priority">
			
				<g:if test="${priorityInstance?.level}">
				<li class="fieldcontain">
					<span id="level-label" class="property-label"><g:message code="priority.level.label" default="Level" /></span>
					
						<span class="property-value" aria-labelledby="level-label"><g:fieldValue bean="${priorityInstance}" field="level"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${priorityInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="priority.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${priorityInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${priorityInstance?.tickets}">
				<li class="fieldcontain">
					<span id="tickets-label" class="property-label"><g:message code="priority.tickets.label" default="Tickets" /></span>
					
						<g:each in="${priorityInstance.tickets}" var="t">
						<span class="property-value" aria-labelledby="tickets-label"><g:link controller="ticket" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:priorityInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${priorityInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
