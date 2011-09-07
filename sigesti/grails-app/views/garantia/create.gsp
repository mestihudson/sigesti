
<%@ page import="sigesti.Garantia" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
		<g:set var="entityName" value="${message(code: 'garantia.label', default: 'Garantia')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<g:javascript library="jquery" plugin="jquery" />
		<g:javascript src="jquery.placeholder.js" />
		<g:javascript src="textarealimiter.js" />
		<g:javascript>
			jQuery.noConflict();
			$(document).ready(function() {
				$('[placeholder]').placeholder();
			});
		</g:javascript>
	</head>
	<body>
		<div class="nav">
			<img src="${resource(dir:'images/icons', file:'home_32.png')}" /><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
			<img src="${resource(dir:'images/icons', file:'list.png')}" /><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link>
		</div>
		<div class="body">
			<!--<h1><g:message code="default.create.label" args="[entityName]" /></h1>-->
			<g:if test="${flash.message}">
				<div class="message canhide">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${garantiaInstance}">
				<div class="errors canhide">
					<g:renderErrors bean="${garantiaInstance}" as="list" />
				</div>
			</g:hasErrors>
			<g:form action="save" onsubmit="\$('[placeholder]').placeholder('clear');" >
				<div class="dialog">
					<p>
						<label for="descricao"><g:message code="garantia.descricao.label" default="Descrição" /></label>
						<g:textField name="descricao" maxlength="64" value="${garantiaInstance?.descricao}" class="value ${hasErrors(bean: garantiaInstance, field: 'descricao', 'errors')}" placeholder="descrição" />

						<label for="detalhes"><g:message code="garantia.detalhes.label" default="Detalhes" /></label>
						<g:textArea onkeydown="progresso_tecla(this.id)" onkeyup="progresso_tecla(this.id)" name="detalhes" id="detalhes" class="value ${hasErrors(bean: garantiaInstance, field: 'detalhes', 'errors')}" value="${garantiaInstance?.detalhes}" placeholder="detalhes" />
						<div id="detalhes_restantes" class="restantes">Caracteres restantes: 1024</div>
					</p>
				</div>
				<div class="buttons">
					<g:submitButton name="create" class="button-create" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</div>
			</g:form>
		</div>
	</body>
</html>
