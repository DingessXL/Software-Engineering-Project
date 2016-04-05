<%@ page import="itworkorders.Technician" %>



<div class="fieldcontain ${hasErrors(bean: technicianInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="technician.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${technicianInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: technicianInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="technician.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${technicianInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: technicianInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="technician.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${technicianInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: technicianInstance, field: 'ticket', 'error')} ">
	<label for="ticket">
		<g:message code="technician.ticket.label" default="Ticket" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${technicianInstance?.ticket?}" var="t">
    <li><g:link controller="ticket" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="ticket" action="create" params="['technician.id': technicianInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ticket.label', default: 'Ticket')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: technicianInstance, field: 'workgroup', 'error')} required">
	<label for="workgroup">
		<g:message code="technician.workgroup.label" default="Workgroup" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="workgroup" name="workgroup.id" from="${itworkorders.Workgroup.list()}" optionKey="id" required="" value="${technicianInstance?.workgroup?.id}" class="many-to-one"/>

</div>

