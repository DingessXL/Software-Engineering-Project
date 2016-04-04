<%@ page import="itworkorders.WorkGroup" %>



<div class="fieldcontain ${hasErrors(bean: workGroupInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="workGroup.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${workGroupInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: workGroupInstance, field: 'queues', 'error')} ">
	<label for="queues">
		<g:message code="workGroup.queues.label" default="Queues" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${workGroupInstance?.queues?}" var="q">
    <li><g:link controller="queue" action="show" id="${q.id}">${q?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="queue" action="create" params="['workGroup.id': workGroupInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'queue.label', default: 'Queue')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: workGroupInstance, field: 'tickets', 'error')} ">
	<label for="tickets">
		<g:message code="workGroup.tickets.label" default="Tickets" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${workGroupInstance?.tickets?}" var="t">
    <li><g:link controller="ticket" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="ticket" action="create" params="['workGroup.id': workGroupInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ticket.label', default: 'Ticket')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: workGroupInstance, field: 'users', 'error')} ">
	<label for="users">
		<g:message code="workGroup.users.label" default="Users" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${workGroupInstance?.users?}" var="u">
    <li><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="user" action="create" params="['workGroup.id': workGroupInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'user.label', default: 'User')])}</g:link>
</li>
</ul>


</div>

