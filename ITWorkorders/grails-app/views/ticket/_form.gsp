<%@ page import="itworkorders.Ticket" %>



<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="ticket.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${ticketInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'phoneNumber', 'error')} ">
	<label for="phoneNumber">
		<g:message code="ticket.phoneNumber.label" default="Phone Number" />
		
	</label>
	<g:textField name="phoneNumber" value="${ticketInstance?.phoneNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'mobileNumber', 'error')} ">
	<label for="mobileNumber">
		<g:message code="ticket.mobileNumber.label" default="Mobile Number" />
		
	</label>
	<g:textField name="mobileNumber" value="${ticketInstance?.mobileNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'roomNumber', 'error')} ">
	<label for="roomNumber">
		<g:message code="ticket.roomNumber.label" default="Room Number" />
		
	</label>
	<g:textField name="roomNumber" value="${ticketInstance?.roomNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'building', 'error')} required">
	<label for="building">
		<g:message code="ticket.building.label" default="Building" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="building" name="building.id" from="${itworkorders.Building.list()}" optionKey="id" required="" value="${ticketInstance?.building?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="ticket.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${itworkorders.Category.list()}" optionKey="id" required="" value="${ticketInstance?.category?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'dateClosed', 'error')} required">
	<label for="dateClosed">
		<g:message code="ticket.dateClosed.label" default="Date Closed" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateClosed" precision="day"  value="${ticketInstance?.dateClosed}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'department', 'error')} required">
	<label for="department">
		<g:message code="ticket.department.label" default="Department" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="department" name="department.id" from="${itworkorders.Department.list()}" optionKey="id" required="" value="${ticketInstance?.department?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="ticket.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${ticketInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'histories', 'error')} ">
	<label for="histories">
		<g:message code="ticket.histories.label" default="Histories" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ticketInstance?.histories?}" var="h">
    <li><g:link controller="history" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="history" action="create" params="['ticket.id': ticketInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'history.label', default: 'History')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="ticket.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${ticketInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="ticket.notes.label" default="Notes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ticketInstance?.notes?}" var="n">
    <li><g:link controller="note" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="note" action="create" params="['ticket.id': ticketInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'note.label', default: 'Note')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'priority', 'error')} required">
	<label for="priority">
		<g:message code="ticket.priority.label" default="Priority" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="priority" name="priority.id" from="${itworkorders.Priority.list()}" optionKey="id" required="" value="${ticketInstance?.priority?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'replies', 'error')} ">
	<label for="replies">
		<g:message code="ticket.replies.label" default="Replies" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ticketInstance?.replies?}" var="r">
    <li><g:link controller="reply" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="reply" action="create" params="['ticket.id': ticketInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'reply.label', default: 'Reply')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="ticket.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="status" name="status.id" from="${itworkorders.Status.list()}" optionKey="id" required="" value="${ticketInstance?.status?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'subject', 'error')} required">
	<label for="subject">
		<g:message code="ticket.subject.label" default="Subject" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="subject" required="" value="${ticketInstance?.subject}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'technician', 'error')} required">
	<label for="technician">
		<g:message code="ticket.technician.label" default="Technician" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="technician" required="" value="${ticketInstance?.technician}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'workgroup', 'error')} required">
	<label for="workgroup">
		<g:message code="ticket.workgroup.label" default="Workgroup" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="workgroup" name="workgroup.id" from="${itworkorders.WorkGroup.list()}" optionKey="id" required="" value="${ticketInstance?.workgroup?.id}" class="many-to-one"/>

</div>

