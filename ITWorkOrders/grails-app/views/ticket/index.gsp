
<%@ page import="itworkorders.Ticket" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html" xmlns:background-color="http://www.w3.org/1999/xhtml"
	  xmlns:foreground-color="http://www.w3.org/1999/xhtml">
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>

	%{--Load in numeric plugin--}%
	<g:javascript src="jquery.numeric.js" />

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
			<!-- Column Headings for Admin and Techs -->

			<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_TECH">
				<g:sortableColumn property="firstName" title="${message(code: 'ticket.firstName.label', default: 'First Name')}" />

				<g:sortableColumn property="lastName" title="${message(code: 'ticket.lastName.label', default: 'Last Name')}" />

				<g:sortableColumn property="subject" title="${message(code: 'ticket.subject.label', default: 'Subject')}" />

				<g:sortableColumn property="technician" title="${message(code: 'ticket.technician.label', default: 'Assigned Technician')}" />

				<g:sortableColumn property="dateCreated" title="${message(code: 'ticket.dateCreated.label', default: 'Date Created')}" />

				<g:sortableColumn property="priority" title="${message(code: 'ticket.status.label', default: 'Priority')}" />
			</sec:ifAnyGranted>
			<!-- Column Headings for Patrons-->

			<sec:ifAnyGranted roles="ROLE_USER">
				<g:sortableColumn property="firstName" title="${message(code: 'ticket.firstName.label', default: 'First Name')}" />

				<g:sortableColumn property="lastName" title="${message(code: 'ticket.lastName.label', default: 'Last Name')}" />

				<g:sortableColumn property="subject" title="${message(code: 'ticket.subject.label', default: 'Subject')}" />

				<g:sortableColumn property="status" title="${message(code: 'ticket.dateCreated.label', default: 'Status')}" />

				<g:sortableColumn property="dateCreated" title="${message(code: 'ticket.dateCreated.label', default: 'Date Created')}" />

			</sec:ifAnyGranted>
		</tr>
		</thead>
		<tbody>
		<g:each in="${ticketInstanceList}" status="i" var="ticketInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

				<!-- Table Items for Admin and Techs -->
				<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_TECH">
					<!--Set Variable for Workgroup Name -->
					<g:set var="workgroupID" value="${ticketInstance.workgroup.id}" />
					<!--Set Variable for Priority -->
					<g:set var="priority" value="${ticketInstance.priority}" />

					<td>${fieldValue(bean: ticketInstance, field: "firstName")}</td>

					<td>${fieldValue(bean: ticketInstance, field: "lastName")}</td>

					<td><g:link action="show" id="${ticketInstance.id}">${fieldValue(bean: ticketInstance, field: "subject")}</g:link></td>

					<td>${fieldValue(bean: ticketInstance, field: "technician")}</td>

					<td>${fieldValue(bean: ticketInstance, field: "dateCreated")}</td>
					<!-- Change Font color based on priority level of ticket.
						Using a depricated tag <font> right now until css is implemented for this
					-->
					<g:if test="${priority=='critical'}"><td foreground-color:red><font color="darkred">${priority}</font></td></g:if>
					<g:if test="${priority=='high'}"><td background-color:orange><font color="#ff8c00">${priority}</font></td></g:if>
					<g:if test="${priority=='normal'}"><td background-color:green><font color="#00008b">${priority}</font></td></g:if>
					<g:if test="${priority=='low'}"><td>${priority}</td></g:if>
				</sec:ifAnyGranted>

				<!-- Table Items for Patrons -->
				<sec:ifAnyGranted roles="ROLE_USER">
					<td>${fieldValue(bean: ticketInstance, field: "firstName")}</td>

					<td>${fieldValue(bean: ticketInstance, field: "lastName")}</td>

					<td><g:link action="show" id="${ticketInstance.id}">${fieldValue(bean: ticketInstance, field: "subject")}</g:link></td>

					<td>${fieldValue(bean: ticketInstance, field: "status")}</td>

					<td>${fieldValue(bean: ticketInstance, field: "dateCreated")}</td>
				</sec:ifAnyGranted>
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<g:paginate total="${ticketInstanceCount ?: 0}" />
	</div>
	<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_TECH, ROLE_USER">
	<h1>Ticket Browser</h1>
			<!-- Ticket Status Table -->

			<fieldset class="buttons">
				<a class="list" href="${createLink(uri: '/ticket/openTickets')}">Opened Tickets</a>
				<a class="list" href="${createLink(uri: '/ticket/closedTickets')}">Closed Tickets</a>

				<!-- Hide assigned, show all tickets buttons and select workgroup from Patrons -->
				<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_TECH">
					<a class="list" href="${createLink(uri: '/ticket/showAssignedTickets')}">Assigned To Me</a>
					<a class="list" href="${createLink(uri: '/ticket/showUnassignedTickets')}">Unassigned</a>
					<a class="list" href="${createLink(uri: '/ticket/showAllTickets')}">Reset</a>
					<g:form name="selectWorkgroup" controller="ticket" action="showWorkgroupTickets">
							<g:select id="workgroup" name="workgroup" from="${itworkorders.Workgroup.list()}" optionKey="id" required="" value="${workgroupID}" class="many-to-one"/>
							<g:actionSubmit class="save" action="showWorkgroupTickets" value="${message(code: 'Select Workgroup', default: 'Select')}" />
					</g:form>
				</sec:ifAnyGranted>
			</fieldset>

	</sec:ifAnyGranted>
	<h1>Search Tickets</h1>
	<table>
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
				<td>Phone Number</td>
				<td>
					<fieldset class="form">
						<g:form action="index" method="GET">
							<div class="fieldcontain">
								<g:textField name="queryPhone" value="${params.query}" />
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

%{--Make queryID only input numeric values--}%
<g:javascript>$("#queryID").numeric()</g:javascript>

%{--Add mask to phone number--}%
<g:javascript>$("#queryPhone").mask("(000)-000-0000")</g:javascript>
</body>
</html>