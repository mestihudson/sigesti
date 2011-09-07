

<%@ page import="sigesti.AssistenciaTecnica" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'assistenciaTecnica.label', default: 'AssistenciaTecnica')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
				<g:javascript library="jquery" plugin="jquery" />
        <g:javascript src="jquery.maskedinput-1.3.min.js" />
        <g:javascript src="jquery.placeholder.js" />
				<g:javascript>
					$(document).ready(function() {
						$(".cnpj").mask("99.999.999/9999-99");
						$(".telefone").mask("(99) 9999-9999");
						$(".fax").mask("(99) 9999-9999");
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
            <g:hasErrors bean="${assistenciaTecnicaInstance}">
            <div class="errors canhide">
							<g:renderErrors bean="${assistenciaTecnicaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" onsubmit="\$('[placeholder]').placeholder('clear');" >
							<g:hiddenField name="id" value="${assistenciaTecnicaInstance?.id}" />
							<g:hiddenField name="version" value="${assistenciaTecnicaInstance?.version}" />
							<div class="dialog">
								<p>
									<label for="cnpj"><g:message code="assistenciaTecnica.cnpj.label" default="CNPJ" /></label>
									<g:textField name="cnpj" value="${assistenciaTecnicaInstance?.cnpj}" class="cnpj value ${hasErrors(bean: assistenciaTecnicaInstance, field: 'cnpj', 'errors')}" placeholder="cnpj" />

									<label for="nome_fantasia"><g:message code="assistenciaTecnica.nome_fantasia.label" default="Nome fantasia" /></label>
									<g:textField name="nome_fantasia" maxlength="64" value="${assistenciaTecnicaInstance?.nome_fantasia}" class="value ${hasErrors(bean: assistenciaTecnicaInstance, field: 'nome_fantasia', 'errors')}" placeholder="nome fantasia" />

									<label for="razao_social"><g:message code="assistenciaTecnica.razao_social.label" default="Razão social" /></label>
									<g:textField name="razao_social" maxlength="64" value="${assistenciaTecnicaInstance?.razao_social}" class="value ${hasErrors(bean: assistenciaTecnicaInstance, field: 'razao_social', 'errors')}" placeholder="razão social" />

									<label for="email"><g:message code="assistenciaTecnica.email.label" default="Email" /></label>
									<g:textField name="email" maxlength="64" value="${assistenciaTecnicaInstance?.email}" class="value ${hasErrors(bean: assistenciaTecnicaInstance, field: 'email', 'errors')}" placeholder="email" />

									<label for="site"><g:message code="assistenciaTecnica.site.label" default="Site" /></label>
									<g:textField name="site" maxlength="64" value="${assistenciaTecnicaInstance?.site}" class="value ${hasErrors(bean: assistenciaTecnicaInstance, field: 'site', 'errors')}" placeholder="site" />

									<label for="contato"><g:message code="assistenciaTecnica.contato.label" default="Contato" /></label>
									<g:textField name="contato" maxlength="64" value="${assistenciaTecnicaInstance?.contato}" class="value ${hasErrors(bean: assistenciaTecnicaInstance, field: 'contato', 'errors')}" placeholder="contato" />

									<label for="responsavel"><g:message code="assistenciaTecnica.responsavel.label" default="Responsável" /></label>
									<g:textField name="responsavel" maxlength="64" value="${assistenciaTecnicaInstance?.responsavel}" class="value ${hasErrors(bean: assistenciaTecnicaInstance, field: 'responsavel', 'errors')}" placeholder="responsável" />

									<label for="fax"><g:message code="assistenciaTecnica.fax.label" default="Fax" /></label>
									<g:textField name="fax" value="${assistenciaTecnicaInstance?.fax}" class="fax value ${hasErrors(bean: assistenciaTecnicaInstance, field: 'fax', 'errors')}" placeholder="fax" />

									<label for="telefone"><g:message code="assistenciaTecnica.telefone.label" default="Telefone" /></label>
									<g:textField name="telefone" value="${assistenciaTecnicaInstance?.telefone}" class="telefone value ${hasErrors(bean: assistenciaTecnicaInstance, field: 'telefone', 'errors')}" placeholder="telefone" />

									<label for="endereco"><g:message code="assistenciaTecnica.endereco.label" default="Endereço" /></label>
									<g:select name="endereco.id" noSelection="['null': '--Selecione--']" class="value ${hasErrors(bean: assistenciaTecnicaInstance, field: 'endereco', 'errors')}" from="${sigesti.Endereco.list()}" optionKey="id" value="${assistenciaTecnicaInstance?.endereco?.id}"  />
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
