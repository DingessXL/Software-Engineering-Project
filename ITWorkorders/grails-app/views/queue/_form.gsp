<%@ page import="itworkorders.Queue" %>



<div class="fieldcontain ${hasErrors(bean: queueInstance, field: 'tickets', 'error')} ">
	<label for="tickets">
		<g:message code="queue.tickets.label" default="Tickets" />
		
	</label>
	<g:select name="tickets" from="${itworkorders.Ticket.list()}" multiple="multiple" optionKey="id" size="5" value="${queueInstance?.tickets*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: queueInstance, field: 'workgroup', 'error')} required">
	<label for="workgroup">
		<g:message code="queue.workgroup.label" default="Workgroup" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="workgroup" name="workgroup.id" from="${itworkorders.WorkGroup.list()}" optionKey="id" required="" value="${queueInstance?.workgroup?.id}" class="many-to-one"/>

</div>

