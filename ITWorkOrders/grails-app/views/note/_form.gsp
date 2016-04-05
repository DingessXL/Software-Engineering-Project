<%@ page import="itworkorders.Note" %>



<div class="fieldcontain ${hasErrors(bean: noteInstance, field: 'note', 'error')} required">
	<label for="note">
		<g:message code="note.note.label" default="Note" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="note" cols="40" rows="5" maxlength="2500" required="" value="${noteInstance?.note}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: noteInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="note.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${noteInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: noteInstance, field: 'ticket', 'error')} required">
	<label for="ticket">
		<g:message code="note.ticket.label" default="Ticket" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ticket" name="ticket.id" from="${itworkorders.Ticket.list()}" optionKey="id" required="" value="${noteInstance?.ticket?.id}" class="many-to-one"/>

</div>

