<%@ page import="itworkorders.Note" %>



<div class="fieldcontain ${hasErrors(bean: noteInstance, field: 'note', 'error')} required">
	<label for="note">
		<g:message code="note.note.label" default="Note" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="note" cols="40" rows="5" maxlength="2500" required="" value="${noteInstance?.note}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: noteInstance, field: 'author', 'error')} ">
	<label for="author">
		<g:message code="note.author.label" default="Author" />
		
	</label>
	<g:select id="author" name="author.id" from="${itworkorders.User.list()}" optionKey="id" value="${noteInstance?.author?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: noteInstance, field: 'ticket', 'error')} ">
	<!-- Removing ticket Label since it is hiddenField
	<label for="ticket">
		<g:message code="note.ticket.label" default="Ticket" />
		
	</label> -->
	<!-- Changed to hiddenField since this should be autopopulated using current ticket -->
	<g:hiddenField id="ticket" name="ticket.id" from="${itworkorders.Ticket.list()}" optionKey="id" value="${noteInstance?.ticket?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

