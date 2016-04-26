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

<!-- Add Document NOT WORKING RIGHT NOW-->

<asset:javascript src="uploadr.manifest.js"/>
<asset:stylesheet href="uploadr.manifest.css"/>

<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'description', 'error')} required">
    <label for="document"> 
        <g:message code="ticket.document.label" default="Document"/>
    </label>
    <uploadr:add name="documentUploader" maxSize="204800" maxConcurrentUploads="3" class="fieldcontain" path="/documents"/>
</div>

<!-- NOTES HIDDEN FROM NON ADMIN or TECH -->

<!-- ADMIN AND TECH RIGHTS -->

<sec:ifLoggedIn>
    <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_TECH">
<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'technician', 'error')} ">
    <!--<label for="technician">
        <g:message code="ticket.technician.label" default="Technician" />

    </label>-->
    <g:hiddenField id="technician" name="technician.id" from="${itworkorders.User.list()}" optionKey="id" value="${ticketInstance?.technician?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

    <div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'workgroup', 'error')} required">
        <label for="workgroup">
            <g:message code="ticket.workgroup.label" default="Workgroup" />
            <span class="required-indicator">*</span>
        </label>
        <g:select id="workgroup" name="workgroup.id" from="${itworkorders.Workgroup.list()}" optionKey="id" required="" value="${ticketInstance?.workgroup?.id}" class="many-to-one"/>
    </div>


<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'status', 'error')} required">
    <label for="status">
        <g:message code="ticket.status.label" default="Ticket Status" />
        <span class="required-indicator">*</span>
    </label>

    <g:select id="status" name="status" from="${ticketInstance.constraints.status.inList}" required="" value="${ticketInstance?.status}" valueMessagePrefix="ticket.status" />

</div>

    </sec:ifAnyGranted>

<!-- NORMAL USER RIGHTS -->
    <sec:ifNotGranted roles="ROLE_ADMIN,ROLE_TECH">

        <!-- NEED TO BE HIDEN FIELDS THAT ARE AUTO CREATED WITH THE DEFAULT VALUES -->
        <div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'workgroup', 'error')} required">
           <!-- REMOVING LABEL
            <label for="workgroup">
                <g:message code="ticket.workgroup.label" default="Workgroup" />
                <span class="required-indicator">*</span>
            </label> -->
            <g:hiddenField id="workgroup" name="workgroup.id" optionKey="id" required="" value="1" class="many-to-one"/>
        </div>

        <!-- ${ticketInstance?.workgroup?.id} -->

        <div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'status', 'error')} required">
            <!-- REMOVE LABEL
            <label for="status">
                <g:message code="ticket.status.label" default="Ticket Status" />
                <span class="required-indicator">*</span>
            </label> -->

            <!-- status value="Open" for users creating ticket -->
            <g:hiddenField id="status" name="status" required="" value="Open" />

        </div>

    </sec:ifNotGranted>

</sec:ifLoggedIn>