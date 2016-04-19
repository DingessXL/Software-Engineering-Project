<%--
  Created by IntelliJ IDEA.
  User: matt
  Date: 4/6/16
  Time: 7:12 PM
--%>

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

<!-- NOTES HIDDEN FROM NON ADMIN or TECH -->

<!-- ADMIN RIGHTS -->

<sec:ifLoggedIn>
    <sec:ifAllGranted roles="ROLE_ADMIN">
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

    </sec:ifAllGranted>

<!-- TECH RIGHTS (samem as admin) -->
    <sec:ifAllGranted roles="ROLE_TECH">
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

    </sec:ifAllGranted>

<!-- NORMAL USER RIGHTS -->
    <sec:ifNotGranted roles="ROLE_ADMIN,ROLE_TECH">
        <!-- This is where we will add a hidden field to default to Serve Help Desk workgroup and Open status -->

    </sec:ifNotGranted>

</sec:ifLoggedIn>