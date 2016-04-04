<%@ page import="itworkorders.Priority" %>



<div class="fieldcontain ${hasErrors(bean: priorityInstance, field: 'level', 'error')} required">
	<label for="level">
		<g:message code="priority.level.label" default="Level" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="level" type="number" min="0" value="${priorityInstance.level}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: priorityInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="priority.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${priorityInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: priorityInstance, field: 'tickets', 'error')} ">
	<label for="tickets">
		<g:message code="priority.tickets.label" default="Tickets" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${priorityInstance?.tickets?}" var="t">
    <li><g:link controller="ticket" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="ticket" action="create" params="['priority.id': priorityInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ticket.label', default: 'Ticket')])}</g:link>
</li>
</ul>


</div>

