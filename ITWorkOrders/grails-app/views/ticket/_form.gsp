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




<!-- REGULAR USER LOCKDOWN -->
<!-- Do not allow users to edit the fields below.  They can only view them. -->
<sec:ifLoggedIn>
	<sec:ifAllGranted roles="ROLE_USER">
		<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'priority', 'error')} required">
			<!--<label for="priority">
				<g:message code="ticket.priority.label" default="Priority" />
				<span class="required-indicator">*</span>
			</label>-->
			<g:hiddenField type="text" name="priority" readonly="true" required="" value="${ticketInstance?.priority}" valueMessagePrefix="ticket.priority"/>
		</div>

		<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'technician', 'error')} ">
			<!--<label for="technician">
				<g:message code="ticket.technician.label" default="Technician" />

			</label>-->
			<g:hiddenField type="text" readonly="true" id="technician" name="technician.id" optionKey="id" value="${ticketInstance?.technician?.id}" class="many-to-one" noSelection="['null': '']"/>

		</div>

		<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'workgroup', 'error')} required">
			<!--<label for="workgroup">
				<g:message code="ticket.workgroup.label" default="Workgroup" />
				<span class="required-indicator">*</span>
			</label>-->
			<g:hiddenField type="text" readonly="true" id="workgroup" name="workgroup.id" from="${itworkorders.Workgroup.list()}" optionKey="id" required="" value="${ticketInstance?.workgroup?.id}" class="many-to-one"/>

		</div>

	</sec:ifAllGranted>
<!-- ROLE TECH AND ADMIN ARE ALLOWED TO VIEW AND EDIT THESE FIELDS -->
	<sec:ifAnyGranted roles="ROLE_TECH, ROLE_ADMIN">

		<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'priority', 'error')} required">
			<label for="priority">
				<g:message code="ticket.priority.label" default="Priority" />
				<span class="required-indicator">*</span>
			</label>
			<g:select name="priority" from="${ticketInstance.constraints.priority.inList}" required="" value="${ticketInstance?.priority}" valueMessagePrefix="ticket.priority"/>

		</div>

		<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'technician', 'error')} ">

			<label for="technician">
				<g:message code="ticket.technician.label" default="Technician" />
				<span class="required-indicator">*</span>
			</label>

			${fieldValue(bean: ticketInstance, field: "technician")}
			<g:hiddenField id="technician" name="technician.id" from="${itworkorders.User.list()}" optionKey="id" value="${ticketInstance?.technician?.id}" class="many-to-one" noSelection="['null': '']"/>

		</div>

		<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'workgroup', 'error')} required">
			<label for="workgroup">
				<g:message code="ticket.workgroup.label" default="Workgroup" />
				<span class="required-indicator">*</span>
			</label>
			${fieldValue(bean: ticketInstance, field: "workgroup")}
			<g:hiddenField id="workgroup" name="workgroup.id" from="${itworkorders.Workgroup.list()}" optionKey="id" required="" value="${ticketInstance?.workgroup?.id}" class="many-to-one"/>
		</div>

	</sec:ifAnyGranted>
</sec:ifLoggedIn>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'status', 'error')} ">
	<!--<label for="status">
		<g:message code="ticket.status.label" default="Ticket Status" />

	</label>-->

	<g:hiddenField id="status" name="status" required="" value="Open" />

</div>

<!-- BEGIN REPLIES TABLE -->

<table>
<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'reply', 'error')} ">
	<tr><th><label for="reply">
		<g:message code="ticket.reply.label" default="Reply" />
	</label></th></tr>

	<g:each in="${ticketInstance?.reply?}" var="r">
		<tr><td><g:link controller="reply" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></td></tr>
	</g:each>
	<tr><td>
		<g:link controller="reply" action="create" params="['ticket.id': ticketInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'reply.label', default: 'Reply')])}</g:link>
	</td></tr>

</div>
</table>

<!-- BEGIN NOTES TABLE -->

<sec:ifLoggedIn>
	<table>
	<!-- ADMIN RIGHTS -->
	<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_TECH">
		<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'note', 'error')} ">
			<tr><th><label for="note">
			<g:message code="ticket.note.label" default="Note" />
			</label></th></tr>

			<g:each in="${ticketInstance?.note?}" var="n">
    		<tr><td><g:link controller="note" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></td></tr>
			</g:each>
			<tr><td>
			<g:link controller="note" action="create" params="['ticket.id': ticketInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'note.label', default: 'Note')])}</g:link>
			</td></tr>

		</div>
	</sec:ifAnyGranted>
	</table>
</sec:ifLoggedIn>

