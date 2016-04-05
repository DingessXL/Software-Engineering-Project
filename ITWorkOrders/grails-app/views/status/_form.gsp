<%@ page import="itworkorders.Status" %>



<div class="fieldcontain ${hasErrors(bean: statusInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="status.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="status" required="" value="${statusInstance?.status}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: statusInstance, field: 'ticket', 'error')} ">
	<label for="ticket">
		<g:message code="status.ticket.label" default="Ticket" />
		
	</label>
	<g:select id="ticket" name="ticket.id" from="${itworkorders.Ticket.list()}" optionKey="id" value="${statusInstance?.ticket?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

