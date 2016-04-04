<%@ page import="itworkorders.Status" %>



<div class="fieldcontain ${hasErrors(bean: statusInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="status.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${statusInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: statusInstance, field: 'tickets', 'error')} ">
	<label for="tickets">
		<g:message code="status.tickets.label" default="Tickets" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${statusInstance?.tickets?}" var="t">
    <li><g:link controller="ticket" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="ticket" action="create" params="['status.id': statusInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ticket.label', default: 'Ticket')])}</g:link>
</li>
</ul>


</div>

