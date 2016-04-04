
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
			
				<g:if test="${ticketInstance?.phoneNumber}">
				<li class="fieldcontain">
					<span id="phoneNumber-label" class="property-label"><g:message code="ticket.phoneNumber.label" default="Phone Number" /></span>
					
						<span class="property-value" aria-labelledby="phoneNumber-label"><g:fieldValue bean="${ticketInstance}" field="phoneNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.mobileNumber}">
				<li class="fieldcontain">
					<span id="mobileNumber-label" class="property-label"><g:message code="ticket.mobileNumber.label" default="Mobile Number" /></span>
					
						<span class="property-value" aria-labelledby="mobileNumber-label"><g:fieldValue bean="${ticketInstance}" field="mobileNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.roomNumber}">
				<li class="fieldcontain">
					<span id="roomNumber-label" class="property-label"><g:message code="ticket.roomNumber.label" default="Room Number" /></span>
					
						<span class="property-value" aria-labelledby="roomNumber-label"><g:fieldValue bean="${ticketInstance}" field="roomNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.building}">
				<li class="fieldcontain">
					<span id="building-label" class="property-label"><g:message code="ticket.building.label" default="Building" /></span>
					
						<span class="property-value" aria-labelledby="building-label"><g:link controller="building" action="show" id="${ticketInstance?.building?.id}">${ticketInstance?.building?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="ticket.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:link controller="category" action="show" id="${ticketInstance?.category?.id}">${ticketInstance?.category?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.dateClosed}">
				<li class="fieldcontain">
					<span id="dateClosed-label" class="property-label"><g:message code="ticket.dateClosed.label" default="Date Closed" /></span>
					
						<span class="property-value" aria-labelledby="dateClosed-label"><g:formatDate date="${ticketInstance?.dateClosed}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="ticket.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${ticketInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.department}">
				<li class="fieldcontain">
					<span id="department-label" class="property-label"><g:message code="ticket.department.label" default="Department" /></span>
					
						<span class="property-value" aria-labelledby="department-label"><g:link controller="department" action="show" id="${ticketInstance?.department?.id}">${ticketInstance?.department?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="ticket.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${ticketInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.histories}">
				<li class="fieldcontain">
					<span id="histories-label" class="property-label"><g:message code="ticket.histories.label" default="Histories" /></span>
					
						<g:each in="${ticketInstance.histories}" var="h">
						<span class="property-value" aria-labelledby="histories-label"><g:link controller="history" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="ticket.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${ticketInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="ticket.notes.label" default="Notes" /></span>
					
						<g:each in="${ticketInstance.notes}" var="n">
						<span class="property-value" aria-labelledby="notes-label"><g:link controller="note" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.priority}">
				<li class="fieldcontain">
					<span id="priority-label" class="property-label"><g:message code="ticket.priority.label" default="Priority" /></span>
					
						<span class="property-value" aria-labelledby="priority-label"><g:link controller="priority" action="show" id="${ticketInstance?.priority?.id}">${ticketInstance?.priority?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.replies}">
				<li class="fieldcontain">
					<span id="replies-label" class="property-label"><g:message code="ticket.replies.label" default="Replies" /></span>
					
						<g:each in="${ticketInstance.replies}" var="r">
						<span class="property-value" aria-labelledby="replies-label"><g:link controller="reply" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="ticket.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:link controller="status" action="show" id="${ticketInstance?.status?.id}">${ticketInstance?.status?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.subject}">
				<li class="fieldcontain">
					<span id="subject-label" class="property-label"><g:message code="ticket.subject.label" default="Subject" /></span>
					
						<span class="property-value" aria-labelledby="subject-label"><g:fieldValue bean="${ticketInstance}" field="subject"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.technician}">
				<li class="fieldcontain">
					<span id="technician-label" class="property-label"><g:message code="ticket.technician.label" default="Technician" /></span>
					
						<span class="property-value" aria-labelledby="technician-label"><g:fieldValue bean="${ticketInstance}" field="technician"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${ticketInstance?.workgroup}">
				<li class="fieldcontain">
					<span id="workgroup-label" class="property-label"><g:message code="ticket.workgroup.label" default="Workgroup" /></span>
					
						<span class="property-value" aria-labelledby="workgroup-label"><g:link controller="workGroup" action="show" id="${ticketInstance?.workgroup?.id}">${ticketInstance?.workgroup?.encodeAsHTML()}</g:link></span>
					
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
