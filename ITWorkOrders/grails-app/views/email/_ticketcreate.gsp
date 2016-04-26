<html>
	<head></head>
	<body>
		<h1>New Ticket Created</h1>
		<p>A new ticket has been created. Please view it <g:link controller="Ticket" action="show" id="${ticketInstance.id}" absolute="true">here.</g:link></p>
		<p>Ticket ID: ${ticketInstance.id}</p>
		<p>Subject: ${ticketInstance.subject}</p>
		<p>Descrption: ${ticketInstance.description}</p>
	</body>
</html>