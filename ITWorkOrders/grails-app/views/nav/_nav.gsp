%{-- 
File: /grails-app/views/nav/_nav.gsp 

Used for sitewide navigation.
Should be rendered on all accesable pages.
--}%
<div class="nav" role="navigation">
	<ul>

		<!-- USER FUNCTIONS -->
		<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
		<li><a class="create" href="${createLink(uri: '/ticket/create')}">New Ticket</a></li>

		<!-- TECHNICIAN FUNCTIONS -->

		<!-- ADMIN FUNCTIONS FOR NAVIGATION -->
		<sec:ifLoggedIn>
			<sec:ifAllGranted roles="ROLE_ADMIN">
				<li><a class="list" href="${createLink(uri: '/user/')}">Users</a></li>
				<li><a class="list" href="${createLink(uri: '/workgroup/')}">Workgroups</a></li>
				<li><a class="list" href="${createLink(uri: '/building/')}">Buildings</a></li>
				<li><a class="list" href="${createLink(uri: '/department/')}">Departments</a></li>
			</sec:ifAllGranted>
		</sec:ifLoggedIn>




		<!-- LOGOUT LINK -->
		<li><g:link class="logout" controller="logout">Logout</g:link></li>
	</ul>
</div>