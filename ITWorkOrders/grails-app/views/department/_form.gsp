<%@ page import="itworkorders.Department" %>



<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'departmentName', 'error')} required">
	<label for="departmentName">
		<g:message code="department.departmentName.label" default="Department Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="departmentName" required="" value="${departmentInstance?.departmentName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: departmentInstance, field: 'departmentAddress', 'error')} ">
	<label for="departmentAddress">
		<g:message code="department.departmentAddress.label" default="Department Address" />
		
	</label>
	<g:textField name="departmentAddress" value="${departmentInstance?.departmentAddress}"/>

</div>

