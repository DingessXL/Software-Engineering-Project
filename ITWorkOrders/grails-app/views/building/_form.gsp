<%@ page import="itworkorders.Building" %>



<div class="fieldcontain ${hasErrors(bean: buildingInstance, field: 'buildingName', 'error')} required">
	<label for="buildingName">
		<g:message code="building.buildingName.label" default="Building Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="buildingName" required="" value="${buildingInstance?.buildingName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: buildingInstance, field: 'buildingAddress', 'error')} ">
	<label for="buildingAddress">
		<g:message code="building.buildingAddress.label" default="Building Address" />
		
	</label>
	<g:textField name="buildingAddress" value="${buildingInstance?.buildingAddress}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: buildingInstance, field: 'ticket', 'error')} ">
	<label for="ticket">
		<g:message code="building.ticket.label" default="Ticket" />
		
	</label>
	<g:select id="ticket" name="ticket.id" from="${itworkorders.Ticket.list()}" optionKey="id" value="${buildingInstance?.ticket?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

