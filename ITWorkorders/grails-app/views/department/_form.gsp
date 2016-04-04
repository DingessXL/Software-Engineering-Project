<%@ page import="itworkorders.Department" %>



<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="department.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${departmentInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'tickets', 'error')} ">
	<label for="tickets">
		<g:message code="department.tickets.label" default="Tickets" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${departmentInstance?.tickets?}" var="t">
    <li><g:link controller="ticket" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="ticket" action="create" params="['department.id': departmentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ticket.label', default: 'Ticket')])}</g:link>
</li>
</ul>


</div>

