
<%@ page import="sigesti.Usuario" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
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
							<td class="name"><g:message code="usuario.id.label" default="Id" /></td>
							<td class="value">${fieldValue(bean: usuarioInstance, field: "id")}</td>
						</tr>
						<tr class="prop even">
							<td class="name"><g:message code="usuario.nome.label" default="Nome" /></td>
							<td class="value">${fieldValue(bean: usuarioInstance, field: "nome")}</td>
						</tr>
						<tr class="prop odd">
							<td class="name"><g:message code="usuario.email.label" default="Email" /></td>
							<td class="value">${fieldValue(bean: usuarioInstance, field: "email")}</td>
						</tr>
						<tr class="prop even">
							<td class="name"><g:message code="usuario.data_cadastro.label" default="Data de cadastro" /></td>
							<td class="value"><g:formatDate date="${usuarioInstance?.data_cadastro}" format="dd/MM/yyyy 'às' HH'h'mm" /></td>
						</tr>
						<tr class="prop odd">
							<td class="name"><g:message code="usuario.nivel.label" default="Nível de acesso" /></td>
							<td class="value">${fieldValue(bean: usuarioInstance, field: "nivel")}</td>
						</tr>
						<tr class="prop even">
							<td class="name"><g:message code="usuario.matricula.label" default="Matrícula funcional" /></td>
							<td class="value">${fieldValue(bean: usuarioInstance, field: "matricula")}</td>
						</tr>
						<tr class="prop odd">
							<td class="name"><g:message code="usuario.area_responsavel.label" default="Área responsável" /></td>
							<td class="value"><g:link controller="areaResponsavel" action="show" id="${usuarioInstance?.area_responsavel?.id}">${usuarioInstance?.area_responsavel?.encodeAsHTML()}</g:link></td>
						</tr>
						<tr class="prop even">
							<td class="name"><g:message code="usuario.lotacao.label" default="Lotação" /></td>
							<td class="value"><g:link controller="lotacao" action="show" id="${usuarioInstance?.lotacao?.id}">${usuarioInstance?.lotacao?.encodeAsHTML()}</g:link></td>
						</tr>
						<tr class="prop odd">
							<td class="name"><g:message code="lotacao.sigla.label" default="Sigla" /></td>
							<td class="value"><g:link controller="lotacao" action="show" id="${usuarioInstance?.lotacao?.id}">${usuarioInstance?.lotacao?.sigla?.encodeAsHTML()}</g:link></td>
						</tr>
						<tr class="prop even">
							<td class="name"><g:message code="lotacao.telefone.label" default="Telefone" /></td>
							<td class="value"><g:link controller="lotacao" action="show" id="${usuarioInstance?.lotacao?.id}">${usuarioInstance?.lotacao?.telefone?.encodeAsHTML()}</g:link></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="buttons">
				<g:form>
					<g:hiddenField name="id" value="${usuarioInstance?.id}" />
					<g:actionSubmit class="button-edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
					<g:actionSubmit class="button-delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</g:form>
			</div>
		</div>
	</body>
</html>
