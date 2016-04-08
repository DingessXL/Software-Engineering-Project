<%@ page import="itworkorders.Ticket" %>



<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="ticket.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${ticketInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="ticket.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${ticketInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="ticket.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${ticketInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'phoneNumber', 'error')} ">
	<label for="phoneNumber">
		<g:message code="ticket.phoneNumber.label" default="Phone Number" />
		
	</label>
	<g:textField name="phoneNumber" value="${ticketInstance?.phoneNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'departmentName', 'error')} ">
	<label for="departmentName">
		<g:message code="ticket.departmentName.label" default="Department Name" />
		
	</label>
	<g:select id="departmentName" name="departmentName.id" from="${itworkorders.Department.list()}" optionKey="id" value="${ticketInstance?.departmentName?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'buildingName', 'error')} ">
	<label for="buildingName">
		<g:message code="ticket.buildingName.label" default="Building Name" />
		
	</label>
	<g:select id="buildingName" name="buildingName.id" from="${itworkorders.Building.list()}" optionKey="id" value="${ticketInstance?.buildingName?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'roomNumber', 'error')} ">
	<label for="roomNumber">
		<g:message code="ticket.roomNumber.label" default="Room Number" />
		
	</label>
	<g:textField name="roomNumber" value="${ticketInstance?.roomNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'subject', 'error')} required">
	<label for="subject">
		<g:message code="ticket.subject.label" default="Subject" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="subject" required="" value="${ticketInstance?.subject}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="ticket.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="2500" required="" value="${ticketInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'technician', 'error')} ">
	<label for="technician">
		<g:message code="ticket.technician.label" default="Technician" />
		
	</label>
	<g:select id="technician" name="technician.id" from="${itworkorders.User.list()}" optionKey="id" value="${ticketInstance?.technician?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'workgroup', 'error')} required">
	<label for="workgroup">
		<g:message code="ticket.workgroup.label" default="Workgroup" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="workgroup" name="workgroup.id" from="${itworkorders.Workgroup.list()}" optionKey="id" required="" value="${ticketInstance?.workgroup?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'ticketStatus', 'error')} required">
	<label for="ticketStatus">
		<g:message code="ticket.ticketStatus.label" default="Ticket Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ticketStatus" name="ticketStatus.id" from="${itworkorders.Status.list()}" optionKey="id" required="" value="${ticketInstance?.ticketStatus?.id}" class="many-to-one"/>

</div>

<!-- Replies Table -->
<br><br><br>
<div class="repliesTable">
	<h3>Replies to Ticket</h3>
	<br />
	<table style="width:90%">
		<tr>
			<th>Name</th>
			<th>Reply</th>
			<th>Date and Time</th>
		</tr>
		<g:each in="${ticketInstance?.reply?}" var="r">
			<tr>
				<td><g:link controller="reply" action="show" id="${r.id}">${r.author}</g:link></td>
				<td><g:link controller="reply" action="show" id="${r.id}">${r.reply}</g:link></td>
				<td>${r.dateCreated}</td>
			</tr>
		</g:each>
		<tr>
			<td colspan="3" style="width:100%"><g:link controller="reply" action="create" params="['ticket.id': ticketInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'reply.label', default: 'Reply')])}</g:link>
			</td>
		</tr>
	</table>
</div>




<!-- Commenting out grails original unordered list
<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'reply', 'error')} ">
	<label for="reply">
		<g:message code="ticket.reply.label" default="Replies to Ticket" />
	</label>
	<ul class="one-to-many">
		<g:each in="${ticketInstance?.reply?}" var="r">
			<li><g:link controller="reply" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
		</g:each>
		<li class="add">
			<g:link controller="reply" action="create" params="['ticket.id': ticketInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'reply.label', default: 'Add Reply')])}</g:link>
		</li>
	</ul>
</div>
-->

<!-- Notes Table -->

<br><br><br>
<div class="notesTable">
	<h3>Notes for Ticket</h3>
	<br />
	<table style="width:90%">
		<tr>
			<th>Name</th>
			<th>Note</th>
			<th>Date and Time</th>
		</tr>
		<g:each in="${ticketInstance?.note?}" var="n">
			<tr>
				<td><g:link controller="note" action="show" id="${n.id}">${n.author}</g:link></td>
				<td><g:link controller="note" action="show" id="${n.id}">${n.note}</g:link></td>
				<td>${n.dateCreated}</td>
			</tr>
		</g:each>
		<tr>
			<td colspan="3" style="width:100%"><g:link controller="note" action="create" params="['ticket.id': ticketInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'note.label', default: 'Add Note')])}</g:link>
			</td>
		</tr>
	</table>
</div>
<!-- Commenting out Grails original unordered list for Replies
<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'note', 'error')} ">
	<label for="note">
		<g:message code="ticket.note.label" default="Note" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${ticketInstance?.note?}" var="n">
    <li><g:link controller="note" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="note" action="create" params="['ticket.id': ticketInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'note.label', default: 'Note')])}</g:link>
</li>
</ul>
</div>
end of orignal grails code-->