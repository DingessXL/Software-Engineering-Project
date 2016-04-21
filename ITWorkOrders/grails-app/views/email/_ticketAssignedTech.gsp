<html>
<head></head>
<body>
<h1>A Ticket Has been assigned to you.</h1>
<p>A ticket has been assigned to you. Please view it <g:link controller="Ticket" action="show" id="${ticketInstance.id}" absolute="true">here.</g:link></p>
<p>Ticket ID: ${ticketInstance.id}</p>
<p>Subject: ${ticketInstance.subject}</p>
<p>Descrption: ${ticketInstance.description}</p>
</body>
</html>