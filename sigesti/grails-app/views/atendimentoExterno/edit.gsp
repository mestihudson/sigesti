
<%@ page import="sigesti.AtendimentoExterno" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
		<g:set var="entityName" value="${message(code: 'atendimentoExterno.label', default: 'AtendimentoExterno')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<g:javascript src="jquery.placeholder.js" />
		<g:javascript src="textarealimiter.js" />
		<g:javascript>
			$(document).ready(function() {
				$('[placeholder]').placeholder();
			});
		</g:javascript>
	</head>
	<body>
		<div class="nav">
			<img src="${resource(dir:'images/icons', file:'home_32.png')}"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
			<img src="${resource(dir:'images/icons', file:'list.png')}"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link>
			<img src="${resource(dir:'images/icons', file:'add.png')}"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
		</div>
		<div class="body">
			<!--<h1><g:message code="default.edit.label" args="[entityName]" /></h1>-->
			<g:if test="${flash.message}">
				<div class="message canhide">
					${flash.message}
				</div>
			</g:if>
			<g:hasErrors bean="${atendimentoExternoInstance}">
				<div class="errors canhide">
					<g:renderErrors bean="${atendimentoExternoInstance}" as="list" />
				</div>
			</g:hasErrors>
			<g:form method="post" onsubmit="\$('[placeholder]').placeholder('clear');" >
				<g:hiddenField name="id" value="${atendimentoExternoInstance?.id}" />
				<g:hiddenField name="version" value="${atendimentoExternoInstance?.version}" />
				<div class="dialog">
					<p>
						<label for="chamado"><g:message code="atendimentoExterno.chamado.label" default="Chamado" /></label>
						<g:select name="chamado.id" noSelection="['null': '--Selecione--']" class="value ${hasErrors(bean: atendimentoExternoInstance, field: 'chamado', 'errors')}" from="${sigesti.Chamado.list()}" optionKey="id" value="${atendimentoExternoInstance?.chamado?.id}"  />

						<label for="assistencia_tecnica"><g:message code="atendimentoExterno.assistencia_tecnica.label" default="Assistência técnica" /></label>
						<g:select name="assistencia_tecnica.id" noSelection="['null': '--Selecione--']" class="value ${hasErrors(bean: atendimentoExternoInstance, field: 'assistencia_tecnica', 'errors')}" from="${sigesti.AssistenciaTecnica.list()}" optionKey="id" value="${atendimentoExternoInstance?.assistencia_tecnica?.id}"  />

						<label for="data_saida"><g:message code="atendimentoExterno.data_saida.label" default="Data de saída" /></label>
						<g:textField name="data_saida" id="data_saida" value="${atendimentoExternoInstance?.data_saida?.format('dd/MM/yyyy')}" readonly="readonly" disabled="disabled" />

						<label for="descricao"><g:message code="atendimentoExterno.descricao.label" default="Descrição" /></label>
						<g:textArea onkeydown="progresso_tecla(this.id)" onkeyup="progresso_tecla(this.id)" name="descricao" id="descricao" class="value ${hasErrors(bean: atendimentoExternoInstance, field: 'descricao', 'errors')}" value="${atendimentoExternoInstance?.descricao}" placeholder="descrição" />
						<div id="descricao_restantes" class="restantes">Caracteres restantes: 1024</div>

						<label for="custo"><g:message code="atendimentoExterno.custo.label" default="Custo" /></label>
						<g:textField name="custo" class="value ${hasErrors(bean: atendimentoExternoInstance, field: 'custo', 'errors')}" value="${fieldValue(bean: atendimentoExternoInstance, field: 'custo')}" placeholder="custo" />

						<label for="data_retorno"><g:message code="atendimentoExterno.data_retorno.label" default="Data de retorno" /></label>
						<g:textField name="data_retorno" value="${atendimentoExternoInstance?.data_retorno?.format('dd/MM/yyyy')}" placeholder="data de retorno" readonly="readonly" disabled="disabled" />

						<label for="garantia"><g:message code="atendimentoExterno.garantia.label" default="Garantia" /></label>
						<g:select name="garantia.id" noSelection="['null': '--Selecione--']" class="value ${hasErrors(bean: atendimentoExternoInstance, field: 'garantia', 'errors')}" from="${sigesti.Garantia.list()}" optionKey="id" value="${atendimentoExternoInstance?.garantia?.id}" noSelection="['null': '']" />
					</p>
				</div>
				<div class="buttons">
					<g:actionSubmit class="button-update" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="button-delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}"
													onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</div>
			</g:form>
		</div>
	</body>
</html>
