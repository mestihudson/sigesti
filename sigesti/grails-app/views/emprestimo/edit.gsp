
<%@ page import="sigesti.Emprestimo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'emprestimo.label', default: 'Emprestimo')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <link href="${resource(dir:'css', file:'base/jquery.ui.all.css')}" rel="stylesheet" type="text/css" />
        <link href="${resource(dir:'css', file:'jquery-ui-timepicker-addon.css')}" rel="stylesheet" type="text/css" />
				<g:javascript src="jquery.ui.datepicker.js" />
				<g:javascript src="jquery.ui.datepicker-pt-BR.js" />
				<g:javascript src="jquery.ui.slider.js" />
				<g:javascript src="jquery-ui-timepicker-addon.js" />
        <g:javascript src="jquery.placeholder.js" />
        <g:javascript src="textarealimiter.js" />
				<g:javascript>
					$(document).ready(function() {
						$('#data_limite').datetimepicker({
							dateFormat: 'yy-mm-dd',
							showSecond: true,
							timeFormat: 'hh:mm:ss.000'
						});
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
            <g:hasErrors bean="${emprestimoInstance}">
            <div class="errors canhide">
							<g:renderErrors bean="${emprestimoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" onsubmit="\$('[placeholder]').placeholder('clear');" >
							<g:hiddenField name="id" value="${emprestimoInstance?.id}" />
							<g:hiddenField name="version" value="${emprestimoInstance?.version}" />
							<div class="dialog">
								<p>
									<label for="data_emprestimo"><g:message code="emprestimo.data_emprestimo.label" default="Data de empréstimo" /></label>
									<g:textField name="data_emprestimo" id="data_emprestimo" value="${emprestimoInstance?.data_emprestimo?.format('dd/MM/yyyy')}"  readonly="readonly" disabled="disabled" />

									<label for="data_limite"><g:message code="emprestimo.data_limite.label" default="Data limite de devolução" /></label>
									<g:textField name="data_limite" id="data_limite" class="value ${hasErrors(bean: emprestimoInstance, field: 'data_limite', 'errors')}" value="${emprestimoInstance?.data_limite?.format('dd/MM/yyyy')}" placeholder="data limite de devolução" readonly="readonly" disabled="disabled" />
                  
                  <label for="data_devolucao"><g:message code="emprestimo.data_devolucao.label" default="Data de devolução" /></label>
									<g:textField name="data_devolucao" id="data_devolucao" class="value ${hasErrors(bean: emprestimoInstance, field: 'data_devolucao', 'errors')}" value="${emprestimoInstance?.data_devolucao?.format('dd/MM/yyyy')}" placeholder="data de devolução" readonly="readonly" disabled="disabled" />

									<label for="justificativa"><g:message code="emprestimo.justificativa.label" default="Justificativa" /></label>
									<g:textArea onkeydown="progresso_tecla(this.id)" onkeyup="progresso_tecla(this.id)" name="justificativa" id="justificativa" class="value ${hasErrors(bean: emprestimoInstance, field: 'justificativa', 'errors')}" value="${emprestimoInstance?.justificativa}" placeholder="justificativa" />
									<div id="justificativa_restantes" class="restantes">Caracteres restantes: 1024</div>

									<label for="observacao"><g:message code="emprestimo.observacao.label" default="Observação" /></label>
									<g:textArea onkeydown="progresso_tecla(this.id)" onkeyup="progresso_tecla(this.id)" name="observacao" id="observacao" class="value ${hasErrors(bean: emprestimoInstance, field: 'observacao', 'errors')}" value="${emprestimoInstance?.observacao}" placeholder="observacao" />
									<div id="observacao_restantes" class="restantes">Caracteres restantes: 1024</div>

									<label for="equipamento"><g:message code="emprestimo.equipamento.label" default="Equipamento" /></label>
									<g:select name="equipamento.id" noSelection="['null': '--Selecione--']" class="value ${hasErrors(bean: emprestimoInstance, field: 'equipamento', 'errors')}" from="${sigesti.Equipamento.findAllByDisponibilidadeNotEqual(false)}" optionKey="id" value="${emprestimoInstance?.equipamento?.id}"  />

									<label for="responsavel"><g:message code="emprestimo.responsavel.label" default="Responsável" /></label>
									<g:select name="responsavel.id" noSelection="['null': '--Selecione--']" class="value ${hasErrors(bean: emprestimoInstance, field: 'responsavel', 'errors')}" from="${sigesti.Usuario.list()}" optionKey="id" value="${emprestimoInstance?.responsavel?.id}"  />

									<label for="solicitante"><g:message code="emprestimo.solicitante.label" default="Solicitante" /></label>
									<g:select name="solicitante.id" noSelection="['null': '--Selecione--']" class="value ${hasErrors(bean: emprestimoInstance, field: 'solicitante', 'errors')}" from="${sigesti.Usuario.list()}" optionKey="id" value="${emprestimoInstance?.solicitante?.id}"  />
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
