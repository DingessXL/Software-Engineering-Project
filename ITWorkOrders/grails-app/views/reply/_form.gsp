<%@ page import="itworkorders.Reply" %>



<div class="fieldcontain ${hasErrors(bean: replyInstance, field: 'reply', 'error')} required">
	<label for="reply">
		<g:message code="reply.reply.label" default="Reply" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="reply" cols="40" rows="5" maxlength="2500" required="" value="${replyInstance?.reply}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: replyInstance, field: 'ticket', 'error')} required">
	<label for="ticket">
		<g:message code="reply.ticket.label" default="Ticket" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ticket" name="ticket.id" from="${itworkorders.Ticket.list()}" optionKey="id" required="" value="${replyInstance?.ticket?.id}" class="many-to-one"/>

</div>

