
<%@ page import="sigesti.Status" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'status.label', default: 'Status')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
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
						$('#data_final').datetimepicker({
							dateFormat: 'yy-mm-dd',
							showSecond: true,
							timeFormat: 'hh:mm:ss.00'
						});
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
            <g:hasErrors bean="${statusInstance}">
            <div class="errors canhide">
                <g:renderErrors bean="${statusInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" onsubmit="\$('[placeholder]').placeholder('clear');" >
                <div class="dialog">
									<p>

										<label for="chamado"><g:message code="status.chamado.label" default="Chamado" /></label>
										<g:select name="chamado.id" noSelection="['null': '--Selecione--']" class="value ${hasErrors(bean: statusInstance, field: 'chamado', 'errors')}" from="${sigesti.Chamado.list()}" optionKey="id" value="${statusInstance?.chamado?.id}"  />

										<label for="tipo_status"><g:message code="status.tipo_status.label" default="Tipo de Status" /></label>
										<g:select name="tipo_status.id" noSelection="['null': '--Selecione--']" class="value ${hasErrors(bean: statusInstance, field: 'tipo_status', 'errors')}" from="${sigesti.TipoStatus.list()}" optionKey="id" value="${statusInstance?.tipo_status?.id}"  />

										<label for="data_inicial"><g:message code="status.data_inicial.label" default="Data inicial" /></label>
										<g:textField name="data_inicial" id="data_inicial" value="${statusInstance?.data_inicial?.format('dd/MM/yyyy')}" readonly="readonly" disabled="disabled" />

										<label for="data_final"><g:message code="status.data_final.label" default="Data final" /></label>
										<g:textField name="data_final" class="value ${hasErrors(bean: statusInstance, field: 'data_final', 'errors')}" value="${statusInstance?.data_final}" placeholder="data final" />


									</p>
                </div>
                <div class="buttons">
                    <g:submitButton name="create" class="button-create" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </div>
            </g:form>
        </div>
    </body>
</html>
