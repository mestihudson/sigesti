
<%@ page import="sigesti.Status" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="main" />
		<g:set var="entityName" value="${message(code: 'status.label', default: 'Status')}" />
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
								<td class="name"><g:message code="status.id.label" default="Id" /></td>
								<td class="value">${fieldValue(bean: statusInstance, field: "id")}</td>
							</tr>

							<tr class="prop even">
								<td class="name"><g:message code="status.chamado.label" default="Chamado" /></td>
								<td class="value"><g:link controller="chamado" action="show" id="${statusInstance?.chamado?.id}">${statusInstance?.chamado?.encodeAsHTML()}</g:link></td>
							</tr>

							<tr class="prop odd">
								<td class="name"><g:message code="status.tipo_status.label" default="Tipo de status" /></td>
								<td class="value"><g:link controller="tipoStatus" action="show" id="${statusInstance?.tipo_status?.id}">${statusInstance?.tipo_status?.encodeAsHTML()}</g:link></td>
							</tr>

							<tr class="prop even">
								<td class="name"><g:message code="status.data_inicial.label" default="Data inicial" /></td>
								<td class="value"><g:formatDate date="${statusInstance?.data_inicial}" format="dd/MM/yyyy 'às' HH'h'mm" /></td>
							</tr>

							<tr class="prop odd">
								<td class="name"><g:message code="status.data_final.label" default="Data final" /></td>
								<td class="value"><g:formatDate date="${statusInstance?.data_final}" format="dd/MM/yyyy 'às' HH'h'mm" /></td>
							</tr>

						</tbody>
					</table>
				</div>
				<div class="buttons">
					<g:form>
						<g:hiddenField name="id" value="${statusInstance?.id}" />
						<g:actionSubmit class="button-edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
						<g:actionSubmit class="button-delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</g:form>
				</div>
		</div>
	</body>
</html>
