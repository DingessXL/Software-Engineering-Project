<%@ page import="itworkorders.Building" %>



<div class="fieldcontain ${hasErrors(bean: buildingInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="building.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="name" name="name.id" from="${itworkorders.Status.list()}" optionKey="id" required="" value="${buildingInstance?.name?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: buildingInstance, field: 'tickets', 'error')} ">
	<label for="tickets">
		<g:message code="building.tickets.label" default="Tickets" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${buildingInstance?.tickets?}" var="t">
    <li><g:link controller="ticket" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="ticket" action="create" params="['building.id': buildingInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ticket.label', default: 'Ticket')])}</g:link>
</li>
</ul>


</div>

