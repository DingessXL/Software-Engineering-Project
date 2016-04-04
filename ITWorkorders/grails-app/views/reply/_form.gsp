<%@ page import="itworkorders.Reply" %>



<div class="fieldcontain ${hasErrors(bean: replyInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="reply.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${replyInstance?.date}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: replyInstance, field: 'reply', 'error')} required">
	<label for="reply">
		<g:message code="reply.reply.label" default="Reply" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="reply" required="" value="${replyInstance?.reply}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: replyInstance, field: 'ticket', 'error')} required">
	<label for="ticket">
		<g:message code="reply.ticket.label" default="Ticket" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ticket" name="ticket.id" from="${itworkorders.Ticket.list()}" optionKey="id" required="" value="${replyInstance?.ticket?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: replyInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="reply.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="user" required="" value="${replyInstance?.user}"/>

</div>

