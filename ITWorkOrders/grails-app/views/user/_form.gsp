<%@ page import="itworkorders.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${userInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="user.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${userInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="user.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${userInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'isTechnician', 'error')} ">
	<label for="isTechnician">
		<g:message code="user.isTechnician.label" default="Is Technician" />
		
	</label>
	<g:checkBox name="isTechnician" value="${userInstance?.isTechnician}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'isAdmin', 'error')} ">
	<label for="isAdmin">
		<g:message code="user.isAdmin.label" default="Is Admin" />
		
	</label>
	<g:checkBox name="isAdmin" value="${userInstance?.isAdmin}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'workgroup', 'error')} required">
	<label for="workgroup">
		<g:message code="user.workgroup.label" default="Workgroup" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="workgroup" name="workgroup.id" from="${itworkorders.Workgroup.list()}" optionKey="id" required="" value="${userInstance?.workgroup?.id}" class="many-to-one"/>

</div>

