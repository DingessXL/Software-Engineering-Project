
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

<!--<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>-->

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

			<g:sortableColumn property="lastUpdated" title="${message(code: 'ticket.lastUpdated.label', default: 'Last Updated')}" />





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

				<td>${fieldValue(bean: ticketInstance, field: "lastUpdated")}</td>



			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<g:paginate total="${ticketInstanceCount ?: 0}" />
	</div>
</div>
</body>
</html>