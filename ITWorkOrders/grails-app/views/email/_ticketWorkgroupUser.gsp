<html>
<head></head>
<body>
<h1>Your ticket has been switched to a new Workgroup</h1>
<p>Your ticket has been switched to a new workgroup. Please view it <g:link controller="Ticket" action="show" id="${ticketInstance.id}" absolute="true">here.</g:link></p>
<p>Ticket ID: ${ticketInstance.id}</p>
<p>Subject: ${ticketInstance.subject}</p>
<p>Descrption: ${ticketInstance.description}</p>
</body>
</html>