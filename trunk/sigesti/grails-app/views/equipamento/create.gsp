
<%@ page import="sigesti.Equipamento" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="main" />
		<g:set var="entityName" value="${message(code: 'equipamento.label', default: 'Equipamento')}" />
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
			<g:hasErrors bean="${equipamentoInstance}">
			<div class="errors canhide">
					<g:renderErrors bean="${equipamentoInstance}" as="list" />
			</div>
			</g:hasErrors>
			<g:form action="save" onsubmit="\$('[placeholder]').placeholder('clear');" >
				<div class="dialog">
					<p>
						<label for="categoria"><g:message code="equipamento.categoria.label" default="Categoria" /></label>
						<g:select name="categoria.id" noSelection="['null': '--Selecione--']" class="value ${hasErrors(bean: equipamentoInstance, field: 'categoria', 'errors')}" from="${sigesti.Categoria.list()}" optionKey="id" value="${equipamentoInstance?.categoria?.id}"  />
						<label for="data_cadastro"><g:message code="equipamento.data_cadastro.label" default="Data de cadastro" /></label>
						<g:textField name="data_cadastro" id="data_datacadastro" value="${equipamentoInstance?.data_cadastro?.format('dd/MM/yyyy')}" readonly="readonly" disabled="disabled" />

						<label for="descricao"><g:message code="equipamento.descricao.label" default="Descrição" /></label>
						<g:textArea onkeydown="progresso_tecla(this.id)" onkeyup="progresso_tecla(this.id)" name="descricao" id="descricao" class="value ${hasErrors(bean: equipamentoInstance, field: 'descricao', 'errors')}" value="${equipamentoInstance?.descricao}" placeholder="descrição" />
						<div id="descricao_restantes" class="restantes">Caracteres restantes: 1024</div>

						<label for="fabricante"><g:message code="equipamento.fabricante.label" default="Fabricante" /></label>
						<g:textField name="fabricante" maxlength="64" value="${equipamentoInstance?.fabricante}" class="value ${hasErrors(bean: equipamentoInstance, field: 'fabricante', 'errors')}" placeholder="fabricante" />
						<label for="modelo"><g:message code="equipamento.modelo.label" default="Modelo" /></label>
						<g:textField name="modelo" maxlength="64" value="${equipamentoInstance?.modelo}" class="value ${hasErrors(bean: equipamentoInstance, field: 'modelo', 'errors')}" placeholder="modelo" />
						<label for="num_serie"><g:message code="equipamento.num_serie.label" default="Número de série" /></label>
						<g:textField name="num_serie" maxlength="64" value="${equipamentoInstance?.num_serie}" class="value ${hasErrors(bean: equipamentoInstance, field: 'num_serie', 'errors')}" placeholder="número de série" />
						<label for="observacao"><g:message code="equipamento.observacao.label" default="Observação" /></label>
						<g:textField name="observacao" maxlength="128" value="${equipamentoInstance?.observacao}" class="value ${hasErrors(bean: equipamentoInstance, field: 'observacao', 'errors')}" placeholder="observação" />
						<label for="patrimonio"><g:message code="equipamento.patrimonio.label" default="Patrimônio" /></label>
						<g:textField name="patrimonio" maxlength="64" value="${equipamentoInstance?.patrimonio}" class="value ${hasErrors(bean: equipamentoInstance, field: 'patrimonio', 'errors')}" placeholder="patrimônio" />
						<label for="lotacao"><g:message code="equipamento.lotacao.label" default="Lotação" /></label>
						<g:select name="lotacao.id" noSelection="['null': '--Selecione--']" class="value ${hasErrors(bean: equipamentoInstance, field: 'lotacao', 'errors')}" from="${sigesti.Lotacao.list()}" optionKey="id" value="${equipamentoInstance?.lotacao?.id}"  />
					</p>
				</div>
				<div class="buttons">
					<g:submitButton name="create" class="button-create" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</div>
			</g:form>
		</div>
	</body>
</html>
