
<%@ page import="itworkorders.Building" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'building.label', default: 'Building')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-building" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
	<g:render template="/grails-app/views/nav/nav" />

	<!--<div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        </ul>
    </div> -->
		<div id="list-building" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="buildingName" title="${message(code: 'building.buildingName.label', default: 'Building Name')}" />
					
						<g:sortableColumn property="buildingAddress" title="${message(code: 'building.buildingAddress.label', default: 'Building Address')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${buildingInstanceList}" status="i" var="buildingInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${buildingInstance.id}">${fieldValue(bean: buildingInstance, field: "buildingName")}</g:link></td>
					
						<td>${fieldValue(bean: buildingInstance, field: "buildingAddress")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
		<!-- Add Link to create new object for class -->
		<div class="nav">
			<a class="list" href="${createLink(uri: '/building/create')}">Create New Building</a>
		</div>
			<div class="pagination">
				<g:paginate total="${buildingInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
