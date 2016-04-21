<%@ page import="itworkorders.Ticket" %>



<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'email', 'error')} required">

    <g:hiddenField type="email" name="email" required="" value="${ticketInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'firstName', 'error')} ">

    <g:hiddenField name="firstName" value="${ticketInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'lastName', 'error')} ">

    <g:hiddenField name="lastName" value="${ticketInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'phoneNumber', 'error')} ">

    <g:hiddenField name="phoneNumber" value="${ticketInstance?.phoneNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'departmentName', 'error')} ">

    <g:hiddenField id="departmentName" name="departmentName.id" from="${itworkorders.Department.list()}" optionKey="id" value="${ticketInstance?.departmentName?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'buildingName', 'error')} ">

    <g:hiddenField id="buildingName" name="buildingName.id" from="${itworkorders.Building.list()}" optionKey="id" value="${ticketInstance?.buildingName?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'roomNumber', 'error')} ">

    <g:hiddenField name="roomNumber" value="${ticketInstance?.roomNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'subject', 'error')} required">

    <g:hiddenField name="subject" required="" value="${ticketInstance?.subject}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'description', 'error')} required">

    <g:hiddenField name="description" cols="40" rows="5" maxlength="2500" required="" value="${ticketInstance?.description}"/>

</div>


<!-- REGULAR USER LOCKDOWN -->
<!-- Do not allow users to edit the fields below.  They can only view them. -->
<sec:ifLoggedIn>
    <!-- ROLE TECH AND ADMIN ARE ALLOWED TO VIEW AND EDIT THESE FIELDS -->
    <sec:ifAnyGranted roles="ROLE_TECH, ROLE_ADMIN">

        <div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'priority', 'error')} required">

            <g:hiddenField name="priority" from="${ticketInstance.constraints.priority.inList}" required="" value="${ticketInstance?.priority}" valueMessagePrefix="ticket.priority"/>

        </div>

        <div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'technician', 'error')} ">

            <g:hiddenField id="technician" name="technician.id" from="${itworkorders.User.list()}" optionKey="id" value="${ticketInstance?.technician?.id}" class="many-to-one" noSelection="['null': '']"/>

        </div>

        <div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'workgroup', 'error')} required">
            <label for="workgroup">
                <g:message code="ticket.workgroup.label" default="Workgroup" />

            </label>
            <g:select id="workgroup" name="workgroup.id" from="${itworkorders.Workgroup.list()}" optionKey="id" required="" value="${ticketInstance?.workgroup?.id}" class="many-to-one"/>

        </div>

    </sec:ifAnyGranted>
</sec:ifLoggedIn>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'ticketStatus', 'error')} ">
    <!--<label for="ticketStatus">
		<g:message code="ticket.ticketStatus.label" default="Ticket Status" />

	</label>-->

    <g:hiddenField type="text" readonly="true " id="ticketStatus" name="ticketStatus.id" from="${itworkorders.Status.list()}" optionKey="id" value="${ticketInstance?.ticketStatus?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>


