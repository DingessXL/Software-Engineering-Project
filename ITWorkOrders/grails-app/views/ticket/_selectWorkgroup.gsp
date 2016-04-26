<%@ page import="itworkorders.Workgroup" %>
<div class="fieldcontain ${hasErrors(bean: ticketInstance, field: 'workgroup', 'error')} ">
    <label for="workgroup">
        <g:message code="ticket.workgroup.label" default="Workgroup" />

    </label>
    <g:select id="workgroup" name="workgroup.id" from="${itworkorders.Workgroup.list()}" optionKey="id" />
</div>