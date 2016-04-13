%{-- File: /grails-app/views/nav/_nav.gsp --}%
<div class="nav" role="navigation">
	<ul>
		<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
		<li><a class="list" href="${createLink(uri: '/user/')}">View Profile</a></li>
		<li><a class="create" href="${createLink(uri: '/ticket/create')}">New Ticket</a></li>
	</ul>
</div>