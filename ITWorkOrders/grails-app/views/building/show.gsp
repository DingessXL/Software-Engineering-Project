
<%@ page import="itworkorders.Building" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'building.label', default: 'Building')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-building" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-building" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list building">
			
				<g:if test="${buildingInstance?.buildingName}">
				<li class="fieldcontain">
					<span id="buildingName-label" class="property-label"><g:message code="building.buildingName.label" default="Building Name" /></span>
					
						<span class="property-value" aria-labelledby="buildingName-label"><g:fieldValue bean="${buildingInstance}" field="buildingName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${buildingInstance?.buildingAddress}">
				<li class="fieldcontain">
					<span id="buildingAddress-label" class="property-label"><g:message code="building.buildingAddress.label" default="Building Address" /></span>
					
						<span class="property-value" aria-labelledby="buildingAddress-label"><g:fieldValue bean="${buildingInstance}" field="buildingAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${buildingInstance?.ticket}">
				<li class="fieldcontain">
					<span id="ticket-label" class="property-label"><g:message code="building.ticket.label" default="Ticket" /></span>
					
						<span class="property-value" aria-labelledby="ticket-label"><g:link controller="ticket" action="show" id="${buildingInstance?.ticket?.id}">${buildingInstance?.ticket?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:buildingInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${buildingInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
