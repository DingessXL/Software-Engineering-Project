<%@ page import="itworkorders.Workgroup" %>



<div class="fieldcontain ${hasErrors(bean: workgroupInstance, field: 'workgroupName', 'error')} required">
	<label for="workgroupName">
		<g:message code="workgroup.workgroupName.label" default="Workgroup Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="workgroupName" required="" value="${workgroupInstance?.workgroupName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: workgroupInstance, field: 'user', 'error')} ">
	<label for="user">
		<g:message code="workgroup.user.label" default="User" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${workgroupInstance?.user?}" var="u">
    <li><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="user" action="create" params="['workgroup.id': workgroupInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'user.label', default: 'User')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: workgroupInstance, field: 'ticket', 'error')} ">
	<label for="ticket">
		<g:message code="workgroup.ticket.label" default="Ticket" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${workgroupInstance?.ticket?}" var="t">
    <li><g:link controller="ticket" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="ticket" action="create" params="['workgroup.id': workgroupInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'ticket.label', default: 'Ticket')])}</g:link>
</li>
</ul>


</div>

