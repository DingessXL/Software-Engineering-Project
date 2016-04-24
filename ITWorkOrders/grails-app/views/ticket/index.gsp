
<%@ page import="itworkorders.Ticket" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-ticket" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

%{-- Render Nav Template --}%
<g:render template="/grails-app/views/nav/nav" />

<div id="list-ticket" class="content scaffold-list" role="main">
	<h1><g:message code="default.list.label" args="[entityName]" /></h1>
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>


	<table>
		<thead>
		<tr>

			<g:sortableColumn property="email" title="${message(code: 'ticket.email.label', default: 'Email')}" />

			<g:sortableColumn property="firstName" title="${message(code: 'ticket.firstName.label', default: 'First Name')}" />

			<g:sortableColumn property="lastName" title="${message(code: 'ticket.lastName.label', default: 'Last Name')}" />

			<g:sortableColumn property="subject" title="${message(code: 'ticket.subject.label', default: 'Subject')}" />

			<g:sortableColumn property="technician" title="${message(code: 'ticket.technician.label', default: 'Assigned Technician')}" />

			<g:sortableColumn property="dateCreated" title="${message(code: 'ticket.dateCreated.label', default: 'Date Created')}" />

			<g:sortableColumn property="status" title="${message(code: 'ticket.status.label', default: 'Status')}" />

		</tr>
		</thead>
		<tbody>
		<g:each in="${ticketInstanceList}" status="i" var="ticketInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

				<td><g:link action="show" id="${ticketInstance.id}">${fieldValue(bean: ticketInstance, field: "email")}</g:link></td>

				<td>${fieldValue(bean: ticketInstance, field: "firstName")}</td>

				<td>${fieldValue(bean: ticketInstance, field: "lastName")}</td>

				<td>${fieldValue(bean: ticketInstance, field: "subject")}</td>

				<td>${fieldValue(bean: ticketInstance, field: "technician")}</td>

				<td>${fieldValue(bean: ticketInstance, field: "dateCreated")}</td>

				<td>${fieldValue(bean: ticketInstance, field: "status")}</td>

			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<g:paginate total="${ticketInstanceCount ?: 0}" />
	</div>
	<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_TECH, ROLE_USER">
	<table>
		<tr><th colspan="3">Ticket Browser</th></tr>
		<tr>
			<!-- Ticket Status Table -->
			<td>
				<table>
					<tr><th>Ticket Status</th></tr>
					<tr><td>
						<fieldset class="buttons">
							<li><a class="list" href="${createLink(uri: '/ticket/openTickets')}">Opened Tickets</a></li>
						</fieldset>
					</td></tr>
					<tr><td>
						<fieldset class="buttons">
							<li><a class="list" href="${createLink(uri: '/ticket/closedTickets')}">Closed Tickets</a></li>
						</fieldset>
					</td></tr>
				</table>
			</td>
			<!-- Workgroup Select Section -->
			<td>
				<table>
					<tr><th>Workgroup Selection</th></tr>
					<tr><td>
						<fieldset class="buttons">
						</fieldset>
					</td></tr>
					<tr><td>
						<fieldset class="buttons">
						</fieldset>
					</td></tr>
				</table>
			</td>
			<!-- Technician Select Section -->
			<td>
				<table>
					<tr><th>Technician Selection</th></tr>
					<tr><td>
						<fieldset class="buttons">
						</fieldset>
					</td></tr>
					<tr><td>
						<fieldset class="buttons">
						</fieldset>
					</td></tr>
				</table>
			</td>
		</tr>

	</table>
	</sec:ifAnyGranted>
	<table>
		<tr><th colspan="3">Search Ticket</th></tr>
		<tr>
			<td>Ticket ID: </td>
			<td>
				<fieldset class="form">
					<g:form action="index" method="GET">
						<div class="fieldcontain">
							<g:field type="number" name="queryID" value="${params.query}" />
						</div>
					</g:form>
				</fieldset>
			</td>
		</tr>

		<!--Only display these search fields if Tech or Admin.  Regular users can only search for tickets they know the ticket ID of.-->
		<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_TECH">
		<tr>
			<td>Email: </td>
			<td>
				<fieldset class="form">
					<g:form action="index" method="GET">
						<div class="fieldcontain">
							<g:textField name="queryEmail" value="${params.query}" />
						</div>
					</g:form>
				</fieldset>
			</td>
		</tr>
		<tr>
			<td>First Name: </td>
			<td>
				<fieldset class="form">
					<g:form action="index" method="GET">
						<div class="fieldcontain">
							<g:textField name="queryFirstName" value="${params.query}" />
						</div>
					</g:form>
				</fieldset>
			</td>
		</tr>
		<tr>
			<td>Last Name: </td>
			<td>
				<fieldset class="form">
					<g:form action="index" method="GET">
						<div class="fieldcontain">
							<g:textField name="queryLastName" value="${params.query}" />
						</div>
					</g:form>
				</fieldset>
			</td>
		</tr>
		<tr>
			<td>Subject: </td>
			<td>
				<fieldset class="form">
					<g:form action="index" method="GET">
						<div class="fieldcontain">
							<g:textField name="querySubject" value="${params.query}" />
						</div>
					</g:form>
				</fieldset>
			</td>
		</tr>
		</sec:ifAnyGranted>
	</table>
</div>
</body>
</html>