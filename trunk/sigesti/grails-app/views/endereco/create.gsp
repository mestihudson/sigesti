
<%@ page import="sigesti.Endereco" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="main" />
		<g:set var="entityName" value="${message(code: 'endereco.label', default: 'Endereco')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<g:javascript library="jquery" plugin="jquery" />
		<g:javascript src="jquery.maskedinput-1.3.min.js" />
		<g:javascript src="jquery.placeholder.js" />
		<g:javascript src="textarealimiter.js" />
		<g:javascript>
			$(document).ready(function() {
				$(".cep").mask("99999-999");
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
			<g:hasErrors bean="${enderecoInstance}">
			<div class="errors canhide">
					<g:renderErrors bean="${enderecoInstance}" as="list" />
			</div>
			</g:hasErrors>
			<g:form action="save" onsubmit="\$('[placeholder]').placeholder('clear');" >
				<div class="dialog">
					<p>
						<label for="logradouro"><g:message code="endereco.logradouro.label" default="Logradouro" /></label>
						<g:textArea onkeydown="progresso_tecla(this.id)" onkeyup="progresso_tecla(this.id)" name="logradouro" id="logradouro" class="value ${hasErrors(bean: enderecoInstance, field: 'logradouro', 'errors')}" value="${enderecoInstance?.logradouro}" placeholder="logradouro" />
						<div id="logradouro_restantes" class="restantes">Caracteres restantes: 1024</div>

						<label for="cidade"><g:message code="endereco.cidade.label" default="Cidade" /></label>
						<g:textField name="cidade" maxlength="64" value="${enderecoInstance?.cidade}" class="value ${hasErrors(bean: enderecoInstance, field: 'cidade', 'errors')}" placeholder="cidade" />
						<label for="uf"><g:message code="endereco.uf.label" default="UF" /></label>
						<g:textField name="uf" maxlength="2" value="${enderecoInstance?.uf}" class="value ${hasErrors(bean: enderecoInstance, field: 'uf', 'errors')}" placeholder="uf" />
						<label for="cep"><g:message code="endereco.cep.label" default="CEP" /></label>
						<g:textField name="cep" value="${enderecoInstance?.cep}" class="cep value ${hasErrors(bean: enderecoInstance, field: 'cep', 'errors')}" placeholder="cep" />
					</p>
				</div>
				<div class="buttons">
					<g:submitButton name="create" class="button-create" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</div>
			</g:form>
		</div>
	</body>
</html>
