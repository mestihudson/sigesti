
<%@ page import="sigesti.Assentamento" %>
<html>
	<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			<meta name="layout" content="main" />
			<g:set var="entityName" value="${message(code: 'assentamento.label', default: 'Assentamento')}" />
			<title><g:message code="default.edit.label" args="[entityName]" /></title>
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
			<g:hasErrors bean="${assentamentoInstance}">
			<div class="errors canhide">
				<g:renderErrors bean="${assentamentoInstance}" as="list" />
			</div>
			</g:hasErrors>
			<g:form method="post" onsubmit="\$('[placeholder]').placeholder('clear');" >
				<g:hiddenField name="id" value="${assentamentoInstance?.id}" />
				<g:hiddenField name="version" value="${assentamentoInstance?.version}" />
				<div class="dialog">
					<p>

						<label for="chamado"><g:message code="assentamento.chamado.label" default="Chamado" /></label>
						<g:select name="chamado.id" noSelection="['null': '--Selecione--']" class="value ${hasErrors(bean: assentamentoInstance, field: 'chamado', 'errors')}" from="${sigesti.Chamado.list()}" optionKey="id" value="${assentamentoInstance?.chamado?.id}"  />

						<label for="descricao"><g:message code="assentamento.descricao.label" default="Descrição" /></label>
						<g:textArea onkeydown="progresso_tecla(this.id)" onkeyup="progresso_tecla(this.id)" name="descricao" id="descricao" class="value ${hasErrors(bean: assentamentoInstance, field: 'descricao', 'errors')}" value="${assentamentoInstance?.descricao}" placeholder="descrição" />
						<div id="descricao_restantes" class="restantes">Caracteres restantes: 1024</div>

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
