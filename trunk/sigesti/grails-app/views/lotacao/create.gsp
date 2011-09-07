
<%@ page import="sigesti.Lotacao" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="main" />
		<g:set var="entityName" value="${message(code: 'lotacao.label', default: 'Lotacao')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<g:javascript library="jquery" plugin="jquery" />
		<g:javascript src="jquery.maskedinput-1.3.min.js" />
		<g:javascript src="jquery.placeholder.js" />
		<g:javascript>
			jQuery.noConflict();
			jQuery(function($){
				$(".telefone").mask("(99) 9999-9999");
			});
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
			<g:hasErrors bean="${lotacaoInstance}">
			<div class="errors canhide">
					<g:renderErrors bean="${lotacaoInstance}" as="list" />
			</div>
			</g:hasErrors>
			<g:form action="save" onsubmit="\$('[placeholder]').placeholder('clear');" >
				<div class="dialog">
					<p>
						<label for="nome">
							<g:message code="lotacao.nome.label" default="Nome" />
						</label>
						<g:textField name="nome" maxlength="64" value="${lotacaoInstance?.nome}" class="value ${hasErrors(bean: lotacaoInstance, field: 'nome', 'errors')}" placeholder="nome" />
						<label for="sigla">
							<g:message code="lotacao.sigla.label" default="Sigla" />
						</label>
						<g:textField name="sigla" maxlength="16" value="${lotacaoInstance?.sigla}" class="value ${hasErrors(bean: lotacaoInstance, field: 'sigla', 'errors')}" placeholder="sigla" />
						<label for="telefone">
							<g:message code="lotacao.telefone.label" default="Telefone" />
						</label>
						<g:textField name="telefone" maxlength="16" value="${lotacaoInstance?.telefone}" class="telefone value ${hasErrors(bean: lotacaoInstance, field: 'telefone', 'errors')}" placeholder="telefone" />
					</p>
				</div>
				<div class="buttons">
					<g:submitButton name="create" class="button-create" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</div>
			</g:form>
		</div>
	</body>
</html>
