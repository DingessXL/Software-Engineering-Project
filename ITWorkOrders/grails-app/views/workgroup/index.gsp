
<%@ page import="itworkorders.Workgroup" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'workgroup.label', default: 'Workgroup')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-workgroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		%{-- Render Nav Template --}%
		<g:render template="/grails-app/views/nav/nav" />

		%{--<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>--}%

		
		<div id="list-workgroup" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="workgroupName" title="${message(code: 'workgroup.workgroupName.label', default: 'Workgroup Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${workgroupInstanceList}" status="i" var="workgroupInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${workgroupInstance.id}">${fieldValue(bean: workgroupInstance, field: "workgroupName")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${workgroupInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
