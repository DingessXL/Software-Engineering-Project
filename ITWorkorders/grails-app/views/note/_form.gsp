<%@ page import="itworkorders.Note" %>



<div class="fieldcontain ${hasErrors(bean: noteInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="note.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${noteInstance?.date}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: noteInstance, field: 'note', 'error')} required">
	<label for="note">
		<g:message code="note.note.label" default="Note" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="note" required="" value="${noteInstance?.note}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: noteInstance, field: 'ticket', 'error')} required">
	<label for="ticket">
		<g:message code="note.ticket.label" default="Ticket" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ticket" name="ticket.id" from="${itworkorders.Ticket.list()}" optionKey="id" required="" value="${noteInstance?.ticket?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: noteInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="note.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="user" required="" value="${noteInstance?.user}"/>

</div>

