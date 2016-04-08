<%@ page import="itworkorders.Workgroup" %>



<div class="fieldcontain ${hasErrors(bean: workgroupInstance, field: 'workgroupName', 'error')} required">
	<label for="workgroupName">
		<g:message code="workgroup.workgroupName.label" default="Workgroup Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="workgroupName" required="" value="${workgroupInstance?.workgroupName}"/>

</div>

