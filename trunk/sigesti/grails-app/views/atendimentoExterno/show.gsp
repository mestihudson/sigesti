
<%@ page import="sigesti.AtendimentoExterno" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'atendimentoExterno.label', default: 'AtendimentoExterno')}" />
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
						<td class="name"><g:message code="atendimentoExterno.id.label" default="Id" /></td>
						<td class="value">${fieldValue(bean: atendimentoExternoInstance, field: "id")}</td>
					</tr>

					<tr class="prop even">
						<td class="name"><g:message code="atendimentoExterno.chamado.label" default="Chamado" /></td>
						<td class="value"><g:link controller="chamado" action="show" id="${atendimentoExternoInstance?.chamado?.id}">${atendimentoExternoInstance?.chamado?.encodeAsHTML()}</g:link></td>
					</tr>

					<tr class="prop odd">
						<td class="name"><g:message code="atendimentoExterno.assistencia_tecnica.label" default="Assistência técnica" /></td>
						<td class="value"><g:link controller="assistenciaTecnica" action="show" id="${atendimentoExternoInstance?.assistencia_tecnica?.id}">${atendimentoExternoInstance?.assistencia_tecnica?.encodeAsHTML()}</g:link></td>
					</tr>

					<tr class="prop even">
						<td class="name"><g:message code="atendimentoExterno.data_saida.label" default="Data de saída" /></td>
						<td class="value"><g:formatDate date="${atendimentoExternoInstance?.data_saida}" format="dd/MM/yyyy 'às' HH'h'mm" /></td>
					</tr>

					<tr class="prop odd">
						<td class="name"><g:message code="atendimentoExterno.descricao.label" default="Descrição" /></td>
						<td class="value">${fieldValue(bean: atendimentoExternoInstance, field: "descricao")}</td>
					</tr>

					<tr class="prop even">
						<td class="name"><g:message code="atendimentoExterno.custo.label" default="Custo" /></td>
						<td class="value">${fieldValue(bean: atendimentoExternoInstance, field: "custo")}</td>
					</tr>

					<tr class="prop odd">
						<td class="name"><g:message code="atendimentoExterno.data_retorno.label" default="Data de retorno" /></td>
						<td class="value"><g:formatDate date="${atendimentoExternoInstance?.data_retorno}" format="dd/MM/yyyy 'às' HH'h'mm" /></td>
					</tr>

					<tr class="prop even">
						<td class="name"><g:message code="atendimentoExterno.garantia.label" default="Garantia" /></td>
						<td class="value"><g:link controller="garantia" action="show" id="${atendimentoExternoInstance?.garantia?.id}">${atendimentoExternoInstance?.garantia?.encodeAsHTML()}</g:link></td>
					</tr>

					<tr class="prop odd">
						<td class="name"><g:message code="garantia.detalhes.label" default="Detalhes" /></td>
						<td class="value"><g:link controller="garantia" action="show" id="${atendimentoExternoInstance?.garantia?.id}">${atendimentoExternoInstance?.garantia?.detalhes?.encodeAsHTML()}</g:link></td>
					</tr>
        </tbody>
      </table>
    </div>
    <div class="buttons">
      <g:form>
        <g:hiddenField name="id" value="${atendimentoExternoInstance?.id}" />
        <g:actionSubmit class="button-edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
        <g:actionSubmit class="button-delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />

        <g:actionSubmit class="button" action="aguardarassistencia" value="${message(code: 'default.button.aguardarassistencia.label', default: 'Analisar')}" onclick="return confirm('${message(code: 'default.button.aguardarassistencia.confirm.message', default: 'Are you sure?')}');" />
        <g:actionSubmit class="button" action="retornardaassistencia" value="${message(code: 'default.button.retornardaassistencia.label', default: 'Devolver')}" onclick="return confirm('${message(code: 'default.button.retornardaassistencia.confirm.message', default: 'Are you sure?')}');" />
      </g:form>
    </div>
  </div>
</body>
</html>
