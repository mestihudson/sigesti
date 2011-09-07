
<%@ page import="sigesti.AssistenciaTecnica" %>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="main" />
	<g:set var="entityName" value="${message(code: 'assistenciaTecnica.label', default: 'AssistenciaTecnica')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
	<g:javascript library="jquery" plugin="jquery" />
	<g:javascript src="jquery-ui-1.8.13.custom.min.js" />
	</head>
	<body>
		<div class="nav">
			<img src="${resource(dir:'images/icons', file:'home_32.png')}"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
			<img src="${resource(dir:'images/icons', file:'list.png')}"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link>
			<img src="${resource(dir:'images/icons', file:'add.png')}"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
		</div>
		<div class="body">
			<!--<h1><g:message code="default.show.label" args="[entityName]" /></h1>-->
			<g:if test="${flash.message}">
			<div class="message canhide">
				${flash.message}
			</div>
			</g:if>
			<div class="dialog">
				<table id="myTable" class="tableview">
					<tbody>
						<tr class="prop odd">
							<td class="name"><g:message code="assistenciaTecnica.id.label" default="Id" /></td>
							<td class="value">${fieldValue(bean: assistenciaTecnicaInstance, field: "id")}</td>
						</tr>
						<tr class="prop even">
							<td class="name"><g:message code="assistenciaTecnica.cnpj.label" default="CNPJ" /></td>
							<td class="value">${fieldValue(bean: assistenciaTecnicaInstance, field: "cnpj")}</td>
						</tr>
						<tr class="prop odd">
							<td class="name"><g:message code="assistenciaTecnica.nome_fantasia.label" default="Nome fantasia" /></td>
							<td class="value">${fieldValue(bean: assistenciaTecnicaInstance, field: "nome_fantasia")}</td>
						</tr>
						<tr class="prop even">
							<td class="name"><g:message code="assistenciaTecnica.razao_social.label" default="Razão social" /></td>
							<td class="value">${fieldValue(bean: assistenciaTecnicaInstance, field: "razao_social")}</td>
						</tr>
						<tr class="prop odd">
							<td class="name"><g:message code="assistenciaTecnica.email.label" default="Email" /></td>
							<td class="value">${fieldValue(bean: assistenciaTecnicaInstance, field: "email")}</td>
						</tr>
						<tr class="prop even">
							<td class="name"><g:message code="assistenciaTecnica.site.label" default="Site" /></td>
							<td class="value">${fieldValue(bean: assistenciaTecnicaInstance, field: "site")}</td>
						</tr>
						<tr class="prop odd">
							<td class="name"><g:message code="assistenciaTecnica.contato.label" default="Contato" /></td>
							<td class="value">${fieldValue(bean: assistenciaTecnicaInstance, field: "contato")}</td>
						</tr>
						<tr class="prop even">
							<td class="name"><g:message code="assistenciaTecnica.responsavel.label" default="Responsável" /></td>
							<td class="value">${fieldValue(bean: assistenciaTecnicaInstance, field: "responsavel")}</td>
						</tr>
						<tr class="prop odd">
							<td class="name"><g:message code="assistenciaTecnica.fax.label" default="Fax" /></td>
							<td class="value">${fieldValue(bean: assistenciaTecnicaInstance, field: "fax")}</td>
						</tr>
						<tr class="prop even">
							<td class="name"><g:message code="assistenciaTecnica.telefone.label" default="Telefone" /></td>
							<td class="value">${fieldValue(bean: assistenciaTecnicaInstance, field: "telefone")}</td>
						</tr>
						<tr class="prop odd">
							<td class="name"><g:message code="assistenciaTecnica.endereco.label" default="Endereço" /></td>
							<td class="value"><g:link controller="endereco" action="show" id="${assistenciaTecnicaInstance?.endereco?.id}">${assistenciaTecnicaInstance?.endereco?.encodeAsHTML()}</g:link></td>
						</tr>
						<tr class="prop even">
							<td class="name"><g:message code="endereco.cep.label" default="CEP" /></td>
							<td class="value"><g:link controller="endereco" action="show" id="${assistenciaTecnicaInstance?.endereco?.id}">${assistenciaTecnicaInstance?.endereco?.cep?.encodeAsHTML()}</g:link></td>
						</tr>
						<tr class="prop odd">
							<td class="name"><g:message code="endereco.cidade.label" default="Cidade" /></td>
							<td class="value"><g:link controller="endereco" action="show" id="${assistenciaTecnicaInstance?.endereco?.id}">${assistenciaTecnicaInstance?.endereco?.cidade?.encodeAsHTML()}</g:link></td>
						</tr>
						<tr class="prop even">
							<td class="name"><g:message code="endereco.cep.label" default="UF" /></td>
							<td class="value"><g:link controller="endereco" action="show" id="${assistenciaTecnicaInstance?.endereco?.id}">${assistenciaTecnicaInstance?.endereco?.uf?.encodeAsHTML()}</g:link></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="buttons">
				<g:form>
					<g:hiddenField name="id" value="${assistenciaTecnicaInstance?.id}" />
					<g:actionSubmit class="button-edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
					<g:actionSubmit class="button-delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</g:form>
			</div>
		</div>
	</body>
</html>
