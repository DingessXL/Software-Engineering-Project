<%@ page import="itworkorders.History" %>



<div class="fieldcontain ${hasErrors(bean: historyInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="history.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${historyInstance?.date}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: historyInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="history.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${historyInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: historyInstance, field: 'ticket', 'error')} required">
	<label for="ticket">
		<g:message code="history.ticket.label" default="Ticket" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ticket" name="ticket.id" from="${itworkorders.Ticket.list()}" optionKey="id" required="" value="${historyInstance?.ticket?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: historyInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="history.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="user" required="" value="${historyInstance?.user}"/>

</div>

