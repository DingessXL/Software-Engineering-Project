
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


%{-- Render Nav Template --}%
<g:render template="/grails-app/views/nav/nav" />

<!--<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>-->

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

				<span class="property-value" aria-labelledby="departmentName-label"><g:fieldValue bean="${ticketInstance}" field="departmentName"/></span>

			</li>
		</g:if>

		<g:if test="${ticketInstance?.buildingName}">
			<li class="fieldcontain">
				<span id="buildingName-label" class="property-label"><g:message code="ticket.buildingName.label" default="Building Name" /></span>

				<span class="property-value" aria-labelledby="buildingName-label"><g:fieldValue bean="${ticketInstance}" field="buildingName"/></span>

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

		<g:if test="${ticketInstance?.priority}">
			<li class="fieldcontain">
				<span id="priority-label" class="property-label"><g:message code="ticket.priority.label" default="Priority" /></span>

				<span class="property-value" aria-labelledby="priority-label"><g:fieldValue bean="${ticketInstance}" field="priority"/></span>

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

				<span class="property-value" aria-labelledby="workgroup-label"><g:fieldValue bean="${ticketInstance}" field="workgroup"/></span>

			</li>
		</g:if>

		<g:if test="${ticketInstance?.status}">
			<li class="fieldcontain">
				<span id="status-label" class="property-label"><g:message code="ticket.status.label" default="Ticket Status" /></span>

				<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${ticketInstance}" field="status"/></span>

			</li>
		</g:if>


		<g:if test="${ticketInstance?.dateCreated}">
			<li class="fieldcontain">
				<span id="dateCreated-label" class="property-label"><g:message code="ticket.dateCreated.label" default="Date Created" /></span>

				<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${ticketInstance?.dateCreated}" /></span>

			</li>
		</g:if>

		<g:if test="${ticketInstance?.lastUpdated}">
			<li class="fieldcontain">
				<span id="lastUpdated-label" class="property-label"><g:message code="ticket.lastUpdated.label" default="Last Updated" /></span>

				<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${ticketInstance?.lastUpdated}" /></span>

			</li>
		</g:if>

	</ol>

	<!-- Will not display replies unless there is one in the ticket -->
	<!-- REPLIES TABLE -->
	<table>
	<g:if test="${ticketInstance?.reply}">
			<tr><th><span id="reply-label" class="property-label"><g:message code="ticket.reply.label" default="Reply" /></span></th></tr>
			<g:each in="${ticketInstance.reply}" var="r">
				<tr><td><span class="property-value" aria-labelledby="reply-label"><g:link controller="reply" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span></td></tr>
			</g:each>
	</g:if>
	<tr><td>
		<g:link controller="reply" action="create" params="['ticket.id': ticketInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'reply.label', default: 'Reply')])}</g:link>
	</td></tr>
	</table>
<!-- HIDE Notes from Normal Users -->
	<sec:ifLoggedIn>

		<!-- NOTES TABLE -->

		<!-- ADMIN RIGHTS and TECH RIGHTS -->
		<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_TECH">
			<table>
			<g:if test="${ticketInstance?.note}">
			<tr><th>
					<span id="note-label" class="property-label"><g:message code="ticket.note.label" default="Notes" /></span>
			</th></tr>
					<g:each in="${ticketInstance.note}" var="n">
						<tr><td><span class="property-value" aria-labelledby="note-label"><g:link controller="note" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></span></td></tr>
					</g:each>

			</g:if>
			<!-- Add Note should be allowed on show page when there are no notes already added to the ticket -->

			<tr><td>
				<g:link controller="note" action="create" params="['ticket.id': ticketInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'note.label', default: 'Note')])}</g:link>
			</td></tr>
			</table>
		</sec:ifAnyGranted>

	</sec:ifLoggedIn>

	<!-- Show ticket history -->

	<table>
		<tr><th>Ticket History</th></tr>

		<g:each in="${ticketInstance?.history}" var="hist">
			<tr><td>${hist.encodeAsHTML()}</td></tr>
		</g:each>
	</table>

	<!-- BUTTONS -->
	<g:form url="[resource:ticketInstance, action:'delete']" method="DELETE">
		<fieldset class="buttons">
			<g:link class="edit" action="edit" resource="${ticketInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>

			<!-- Limit Delete button to admin role -->
			<sec:ifLoggedIn>
				<sec:ifAllGranted roles="ROLE_ADMIN">
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</sec:ifAllGranted>

				<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_TECH">
					<!-- Assign to technician button -->
						<g:link class="edit" action="editTech" resource="${ticketInstance}"><g:message code="Assign Technician" default="Assign Technician" /></g:link>
						<g:link class="edit" action="editWorkgroup" resource="${ticketInstance}"><g:message code="Switch Workgroup" default="Switch Workgroup" /></g:link>

				</sec:ifAnyGranted>
				<sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_TECH,ROLE_USER">
					<!-- OPEN / CLOSE TICKET BUTTONS -->
					<g:if test="${ticketInstance?.status.equals("Open")}">
						<g:link controller="reply" action="createCloseReply" params="['ticket.id': ticketInstance?.id]">${message(code: 'Close Ticket', args: [message(code: 'reply.label', default: 'Close Ticket')])}</g:link>

						<!--<g:actionSubmit class="save" action="close" value="Close Ticket" />-->
					</g:if>
					<g:if test="${ticketInstance?.status.equals("Closed")}">
						<g:actionSubmit class="save" action="open" value="Reopen Ticket" />
					</g:if>
				</sec:ifAnyGranted>
			</sec:ifLoggedIn>
		</fieldset>
	</g:form>
</div>
</body>
</html>
