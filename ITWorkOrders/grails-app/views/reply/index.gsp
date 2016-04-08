
<%@ page import="itworkorders.Reply" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'reply.label', default: 'Reply')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-reply" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-reply" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="reply" title="${message(code: 'reply.reply.label', default: 'Reply')}" />
					
						<th><g:message code="reply.author.label" default="Author" /></th>
					
						<th><g:message code="reply.ticket.label" default="Ticket" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'reply.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'reply.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${replyInstanceList}" status="i" var="replyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${replyInstance.id}">${fieldValue(bean: replyInstance, field: "reply")}</g:link></td>
					
						<td>${fieldValue(bean: replyInstance, field: "author")}</td>
					
						<td>${fieldValue(bean: replyInstance, field: "ticket")}</td>
					
						<td><g:formatDate date="${replyInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${replyInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${replyInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
