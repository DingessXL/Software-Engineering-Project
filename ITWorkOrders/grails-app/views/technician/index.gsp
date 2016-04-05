
<%@ page import="itworkorders.Technician" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'technician.label', default: 'Technician')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-technician" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-technician" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="email" title="${message(code: 'technician.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="firstName" title="${message(code: 'technician.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'technician.lastName.label', default: 'Last Name')}" />
					
						<th><g:message code="technician.workgroup.label" default="Workgroup" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${technicianInstanceList}" status="i" var="technicianInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${technicianInstance.id}">${fieldValue(bean: technicianInstance, field: "email")}</g:link></td>
					
						<td>${fieldValue(bean: technicianInstance, field: "firstName")}</td>
					
						<td>${fieldValue(bean: technicianInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: technicianInstance, field: "workgroup")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${technicianInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
