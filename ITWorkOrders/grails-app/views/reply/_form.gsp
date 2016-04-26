<%@ page import="itworkorders.Reply" %>



<div class="fieldcontain ${hasErrors(bean: replyInstance, field: 'reply', 'error')} required">
	<label for="reply">
		<g:message code="reply.reply.label" default="Add Reply to Close Ticket:" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="reply" cols="40" rows="5" maxlength="2500" required="" value="${replyInstance?.reply}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: replyInstance, field: 'author', 'error')} ">
	<!-- <label for="author">
		<g:message code="reply.author.label" default="Author" />
		
	</label> -->
	<!-- SET AUTHOR TO CURRENT LOGGED IN USER -->
	<g:set var="userID"><sec:loggedInUserInfo field="id" /></g:set>
	<g:hiddenField id="author" name="author.id" from="${itworkorders.User.list()}" optionKey="id" value="${userID}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: replyInstance, field: 'ticket', 'error')}">
	<!--Removing ticket label since it is a hiddenField
	<label for="ticket">
		<g:message code="reply.ticket.label" default="Ticket" />
		<span class="required-indicator">*</span>
	</label> -->
	<!-- Added this as hidden field so that the ticket ID is passed correctly and the reply is actually added to the ticket.-->
	<g:hiddenField id="ticket" name="ticket.id" from="${itworkorders.Ticket.list()}" optionKey="id" required="" value="${replyInstance?.ticket?.id}" class="many-to-one"/>

</div>

