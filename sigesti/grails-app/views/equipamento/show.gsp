
<%@ page import="sigesti.Equipamento" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
		<g:set var="entityName" value="${message(code: 'equipamento.label', default: 'Equipamento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
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
							<td class="name"><g:message code="equipamento.id.label" default="Id" /></td>
							<td class="value">${fieldValue(bean: equipamentoInstance, field: "id")}</td>
						</tr>
						<tr class="prop even">
							<td class="name"><g:message code="equipamento.categoria.label" default="Categoria" /></td>
							<td class="value"><g:link controller="categoria" action="show" id="${equipamentoInstance?.categoria?.id}">${equipamentoInstance?.categoria?.encodeAsHTML()}</g:link></td>
						</tr>
						<tr class="prop odd">
							<td class="name"><g:message code="equipamento.data_cadastro.label" default="Data de cadastro" /></td>
							<td class="value"><g:formatDate date="${equipamentoInstance?.data_cadastro}" format="dd/MM/yyyy 'às' HH'h'mm" /></td>
						</tr>
						<tr class="prop even">
							<td class="name"><g:message code="equipamento.descricao.label" default="Descrição" /></td>
							<td class="value">${fieldValue(bean: equipamentoInstance, field: "descricao")}</td>
						</tr>
						<tr class="prop odd">
							<td class="name"><g:message code="equipamento.fabricante.label" default="Fabricante" /></td>
							<td class="value">${fieldValue(bean: equipamentoInstance, field: "fabricante")}</td>
						</tr>
						<tr class="prop even">
							<td class="name"><g:message code="equipamento.modelo.label" default="Modelo" /></td>
							<td class="value">${fieldValue(bean: equipamentoInstance, field: "modelo")}</td>
						</tr>
						<tr class="prop odd">
							<td class="name"><g:message code="equipamento.num_serie.label" default="Número de serie" /></td>
							<td class="value">${fieldValue(bean: equipamentoInstance, field: "num_serie")}</td>
						</tr>
						<tr class="prop even">
							<td class="name"><g:message code="equipamento.observacao.label" default="Observação" /></td>
							<td class="value">${fieldValue(bean: equipamentoInstance, field: "observacao")}</td>
						</tr>
						<tr class="prop odd">
							<td class="name"><g:message code="equipamento.patrimonio.label" default="Patrimônio" /></td>
							<td class="value">${fieldValue(bean: equipamentoInstance, field: "patrimonio")}</td>
						</tr>
						<tr class="prop even">
							<td class="name"><g:message code="equipamento.lotacao.label" default="Lotação" /></td>
							<td class="value"><g:link controller="lotacao" action="show" id="${equipamentoInstance?.lotacao?.id}">${equipamentoInstance?.lotacao?.encodeAsHTML()}</g:link></td>
						</tr>
						<tr class="prop odd">
							<td class="name"><g:message code="lotacao.sigla.label" default="Sigla" /></td>
							<td class="value"><g:link controller="lotacao" action="show" id="${equipamentoInstance?.lotacao?.id}">${equipamentoInstance?.lotacao?.sigla?.encodeAsHTML()}</g:link></td>
						</tr>
						<tr class="prop even">
							<td class="name"><g:message code="lotacao.telefone.label" default="Telefone" /></td>
							<td class="value"><g:link controller="lotacao" action="show" id="${equipamentoInstance?.lotacao?.id}">${equipamentoInstance?.lotacao?.telefone?.encodeAsHTML()}</g:link></td>
						</tr>
            <tr class="prop odd">
              <td class="name"><g:message code="equipamento.disponibilidade.label" default="Disponibilidade" /></td>
              <td class="value">${equipamentoInstance?.disponibilidade ? 'disponível': 'indisponível'}</td>
            </tr>
					</tbody>
				</table>
			</div>
			<div class="buttons">
				<g:form>
					<g:hiddenField name="id" value="${equipamentoInstance?.id}" />
					<g:actionSubmit class="button-edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
					<g:actionSubmit class="button-delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</g:form>
			</div>
		</div>
	</body>
</html>
