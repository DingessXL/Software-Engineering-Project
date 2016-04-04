
<%@ page import="itworkorders.History" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'history.label', default: 'History')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-history" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-history" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="date" title="${message(code: 'history.date.label', default: 'Date')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'history.description.label', default: 'Description')}" />
					
						<th><g:message code="history.ticket.label" default="Ticket" /></th>
					
						<g:sortableColumn property="user" title="${message(code: 'history.user.label', default: 'User')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${historyInstanceList}" status="i" var="historyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${historyInstance.id}">${fieldValue(bean: historyInstance, field: "date")}</g:link></td>
					
						<td>${fieldValue(bean: historyInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: historyInstance, field: "ticket")}</td>
					
						<td>${fieldValue(bean: historyInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${historyInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
