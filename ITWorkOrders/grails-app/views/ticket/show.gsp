
<%@ page import="itworkorders.Ticket" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ticket" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ticket" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ticket">
			
				<g:if test="${ticketInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="ticket.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${ticketInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="ticket.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${ticketInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="ticket.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${ticketInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.phoneNumber}">
				<li class="fieldcontain">
					<span id="phoneNumber-label" class="property-label"><g:message code="ticket.phoneNumber.label" default="Phone Number" /></span>
					
						<span class="property-value" aria-labelledby="phoneNumber-label"><g:fieldValue bean="${ticketInstance}" field="phoneNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.departmentName}">
				<li class="fieldcontain">
					<span id="departmentName-label" class="property-label"><g:message code="ticket.departmentName.label" default="Department Name" /></span>
					
						<span class="property-value" aria-labelledby="departmentName-label"><g:link controller="department" action="show" id="${ticketInstance?.departmentName?.id}">${ticketInstance?.departmentName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.buildingName}">
				<li class="fieldcontain">
					<span id="buildingName-label" class="property-label"><g:message code="ticket.buildingName.label" default="Building Name" /></span>
					
						<span class="property-value" aria-labelledby="buildingName-label"><g:link controller="building" action="show" id="${ticketInstance?.buildingName?.id}">${ticketInstance?.buildingName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.roomNumber}">
				<li class="fieldcontain">
					<span id="roomNumber-label" class="property-label"><g:message code="ticket.roomNumber.label" default="Room Number" /></span>
					
						<span class="property-value" aria-labelledby="roomNumber-label"><g:fieldValue bean="${ticketInstance}" field="roomNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.subject}">
				<li class="fieldcontain">
					<span id="subject-label" class="property-label"><g:message code="ticket.subject.label" default="Subject" /></span>
					
						<span class="property-value" aria-labelledby="subject-label"><g:fieldValue bean="${ticketInstance}" field="subject"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="ticket.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${ticketInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.technician}">
				<li class="fieldcontain">
					<span id="technician-label" class="property-label"><g:message code="ticket.technician.label" default="Technician" /></span>
					
						<span class="property-value" aria-labelledby="technician-label"><g:link controller="user" action="show" id="${ticketInstance?.technician?.id}">${ticketInstance?.technician?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.workgroup}">
				<li class="fieldcontain">
					<span id="workgroup-label" class="property-label"><g:message code="ticket.workgroup.label" default="Workgroup" /></span>
					
						<span class="property-value" aria-labelledby="workgroup-label"><g:link controller="workgroup" action="show" id="${ticketInstance?.workgroup?.id}">${ticketInstance?.workgroup?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.ticketStatus}">
				<li class="fieldcontain">
					<span id="ticketStatus-label" class="property-label"><g:message code="ticket.ticketStatus.label" default="Ticket Status" /></span>
					
						<span class="property-value" aria-labelledby="ticketStatus-label"><g:link controller="status" action="show" id="${ticketInstance?.ticketStatus?.id}">${ticketInstance?.ticketStatus?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.reply}">
				<li class="fieldcontain">
					<span id="reply-label" class="property-label"><g:message code="ticket.reply.label" default="Reply" /></span>
					
						<g:each in="${ticketInstance.reply}" var="r">
						<span class="property-value" aria-labelledby="reply-label"><g:link controller="reply" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.note}">
				<li class="fieldcontain">
					<span id="note-label" class="property-label"><g:message code="ticket.note.label" default="Note" /></span>
					
						<g:each in="${ticketInstance.note}" var="n">
						<span class="property-value" aria-labelledby="note-label"><g:link controller="note" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:ticketInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${ticketInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
