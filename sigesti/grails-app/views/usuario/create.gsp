
<%@ page import="sigesti.Usuario" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="main" />
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<g:javascript library="jquery" plugin="jquery" />
		<g:javascript src="jquery-ui-1.8.13.custom.min.js" />
		<g:javascript src="jquery.placeholder.js" />
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
			<g:hasErrors bean="${usuarioInstance}">
			<div class="errors canhide">
				<g:renderErrors bean="${usuarioInstance}" as="list" />
			</div>
			</g:hasErrors>
			<g:form action="save" onsubmit="\$('[placeholder]').placeholder('clear');" >
					<div class="dialog">
						<p>
							<label for="nome"><g:message code="usuario.nome.label" default="Nome" /></label>
							<g:textField name="nome" maxlength="64" value="${usuarioInstance?.nome}" class="value ${hasErrors(bean: usuarioInstance, field: 'nome', 'errors')}" placeholder="nome completo" />

							<label for="senha"><g:message code="usuario.senha.label" default="Senha" /></label>
							<g:passwordField name="senha" maxlength="16" value="${usuarioInstance?.senha}" class="value ${hasErrors(bean: usuarioInstance, field: 'senha', 'errors')}" placeholder="senha" />

							<label for="confirma_senha"><g:message code="usuario.confirma_senha.label" default="Confirma Senha" /></label>
							<g:passwordField name="confirma_senha" maxlength="16" value="${usuarioInstance?.confirma_senha}" class="value ${hasErrors(bean: usuarioInstance, field: 'confirma_senha', 'errors')}" placeholder="confirma senha" />

							<label for="email"><g:message code="usuario.email.label" default="Email" /></label>
							<g:textField name="email" maxlength="64" value="${usuarioInstance?.email}" class="value ${hasErrors(bean: usuarioInstance, field: 'email', 'errors')}" placeholder="email" />

							<label for="data_cadastro"><g:message code="usuario.data_cadastro.label" default="Data de cadastro" /></label>
							<g:textField name="data_cadastro" id="data_cadastro" value="${usuarioInstance?.data_cadastro?.format('dd/MM/yyyy')}" readonly="readonly" disabled="disabled" />

							<label for="nivel"><g:message code="usuario.nivel.label" default="Nível" /></label>
							<g:select name="nivel" noSelection="['null': '--Selecione--']" class="value ${hasErrors(bean: usuarioInstance, field: 'nivel', 'errors')}" from="${usuarioInstance.constraints.nivel.inList}" value="${usuarioInstance?.nivel}" valueMessagePrefix="usuario.nivel"  />

							<label for="matricula"><g:message code="usuario.matricula.label" default="Matrícula" /></label>
							<g:textField name="matricula" maxlength="64" value="${usuarioInstance?.matricula}" class="value ${hasErrors(bean: usuarioInstance, field: 'matricula', 'errors')}" placeholder="matrícula" />

							<label for="area_responsavel"><g:message code="usuario.area_responsavel.label" default="Área responsável" /></label>
							<g:select name="area_responsavel.id" noSelection="[null : '--Selecione--']" class="value ${hasErrors(bean: usuarioInstance, field: 'area_responsavel', 'errors')}" from="${sigesti.AreaResponsavel.list()}" optionKey="id" value="${usuarioInstance?.area_responsavel?.id}"  />

							<label for="lotacao"><g:message code="usuario.lotacao.label" default="Lotação" /></label>
							<g:select name="lotacao.id" noSelection="[null : '--Selecione--']" class="value ${hasErrors(bean: usuarioInstance, field: 'lotacao', 'errors')}" from="${sigesti.Lotacao.list()}" optionKey="id" value="${usuarioInstance?.lotacao?.id}"  />
						</p>
					</div>
					<div class="buttons">
						<g:submitButton name="create" class="button-create" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</div>
			</g:form>
		</div>
	</body>
</html>
