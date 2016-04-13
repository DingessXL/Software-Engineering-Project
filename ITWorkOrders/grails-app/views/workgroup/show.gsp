
<%@ page import="itworkorders.Workgroup" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'workgroup.label', default: 'Workgroup')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-workgroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		%{-- Render Nav Template --}%
		<g:render template="/grails-app/views/nav/nav" />

		
		<div id="show-workgroup" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list workgroup">
			
				<!--Comented out original code

				<g:if test="${workgroupInstance?.workgroupName}">
				<li class="fieldcontain">
					<span id="workgroupName-label" class="property-label"><g:message code="workgroup.workgroupName.label" default="Workgroup Name" /></span>
					
						<span class="property-value" aria-labelledby="workgroupName-label"><g:fieldValue bean="${workgroupInstance}" field="workgroupName"/></span>
					
				</li>
				</g:if>
			

				<g:if test="${workgroupInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="workgroup.user.label" default="User" /></span>
					
						<g:each in="${workgroupInstance.user}" var="u">
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>-->
			

				<!-- Start Workgroup Queue display-->
				<g:if test="${workgroupInstance?.ticket}">
				<li class="fieldcontain">
					<!--<span id="ticket-label" class="property-label"><g:message code="workgroup.ticket.label" default="Ticket" /></span>-->
						<table id="queue-table">
							<tr id="queue-table-header">
								<th>ID</th>
								<th>Name</th>
								<th>Subject</th>
								<th>Status</th>
								<th>Assigned</th>
							</tr>
							<g:each in="${workgroupInstance.ticket}" var="t">
								<tr>
									<td>
										<span class="property-value" aria-labelledby="ticket-label"><g:link controller="ticket" action="show" id="${t.id}">
											${t.id}
										</g:link>
										</span>
									</td>
									
									<td>
										<g:if test="${(t.firstName != '') &&  ($t?.lastName != '')}">
											
											${t.firstName} ${t.lastName}
										
										</g:if>
										<g:else>
									
											<i>(No Name Provided)</i>

										</g:else>
									</td>
									<td>
										<span class="property-value" aria-labelledby="ticket-label"><g:link controller="ticket" action="show" id="${t.id}">
											${t.subject}
										</g:link>
										</span>
									</td>
								
									<td>
										${t.ticketStatus}
									</td>


									<g:if test="${t?.technician}">
										<td>
											${t.technician}
										</td>
									</g:if>

									<g:else>
										<td>
											Unassigned
										</td>
									</g:else>
								</tr>
								
							</g:each>
						</table>
					
				</li>
				</g:if>
				<!-- End Workgroup Queue display-->

			</ol>
			<g:form url="[resource:workgroupInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${workgroupInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
