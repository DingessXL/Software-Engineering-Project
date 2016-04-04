<%@ page import="itworkorders.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'fname', 'error')} required">
	<label for="fname">
		<g:message code="user.fname.label" default="Fname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fname" required="" value="${userInstance?.fname}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lname', 'error')} required">
	<label for="lname">
		<g:message code="user.lname.label" default="Lname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lname" required="" value="${userInstance?.lname}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'tickets', 'error')} ">
	<label for="tickets">
		<g:message code="user.tickets.label" default="Tickets" />
		
	</label>
	<g:select name="tickets" from="${itworkorders.Ticket.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.tickets*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${userInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'workgroup', 'error')} required">
	<label for="workgroup">
		<g:message code="user.workgroup.label" default="Workgroup" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="workgroup" name="workgroup.id" from="${itworkorders.WorkGroup.list()}" optionKey="id" required="" value="${userInstance?.workgroup?.id}" class="many-to-one"/>

</div>

