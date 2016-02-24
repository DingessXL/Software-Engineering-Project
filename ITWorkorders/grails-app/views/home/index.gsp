<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to GC Forms</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				/* margin: 1em .5em .625em 9em; */
				margin: 0 auto 0 auto;
				padding: 15px;


			}
			.helper {
				#position: absolute; #top: 50%;
				display: table-cell; 
				vertical-align: middle;
			}
			.content {
				#position: relative; 
				#top: -50%;
				margin:0 auto;
				width:50%;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
		</style>
	</head>
	<body>
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="page-body" role="main">
		<!--
			<h1>Welcome to GC Forms</h1>
			<p>Georgia College would like for you to our new Electronic Forms, Powered by GC Workflow</p>

			<div id="controller-list" role="navigation">
				<h2>Available Controllers:</h2>
				<ul>
					<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
						<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
					</g:each>
				</ul>
		-->
		<h1 class="text-center"><g:message code="default.home.label"/></h1>
	<div class="row">
		<div class="col-lg-6">
			<div class="content">
				<div class="helper">
					<h2><u>IT Forms</u></h2>
					<ul>
						<li><g:link controller="PropertyOffCampus">Property Off Campus</g:link></li>
						<li><g:link controller="AdminRequest">PC Administration Request</g:link></li>
						<li><g:link controller="Home">Template</g:link></li>
						<li><g:link controller="Home">Template</g:link></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div class="content">
				<div class="helper">
					<h2><u>Registrar</u></h2>
					<ul >
						<li><g:link controller="Home">Template1</g:link></li>
						<li><g:link controller="Home">Template2</g:link></li>
						<li><g:link controller="Home">Template3</g:link></li>
						<li><g:link controller="Home">Template4</g:link></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-6">
			<div class="content">
				<div class="helper">
					<h2><u>Template</u></h2>
					<ul>
						<li><g:link controller="Home">Template1</g:link></li>
						<li><g:link controller="Home">Template2</g:link></li>
						<li><g:link controller="Home">Template3</g:link></li>
						<li><g:link controller="Home">Template4</g:link></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div class="content">
				<div class="helper">
					<h2><u>Template</u></h2>
					<ul>
						<li><g:link controller="Home">Template1</g:link></li>
						<li><g:link controller="Home">Template2</g:link></li>
						<li><g:link controller="Home">Template3</g:link></li>
						<li><g:link controller="Home">Template4</g:link></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
			</div>
		</div>
	</body>
</html>
