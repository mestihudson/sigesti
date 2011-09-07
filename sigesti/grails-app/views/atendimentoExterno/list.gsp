
<%@ page import="sigesti.AtendimentoExterno" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
		<g:set var="entityName" value="${message(code: 'atendimentoExterno.label', default: 'AtendimentoExterno')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
    <g:javascript src="truncatexto.js" />
	</head>
	<body>
		<div class="nav">
			<img src="${resource(dir:'images/icons', file:'home_32.png')}"><a href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
			<img src="${resource(dir:'images/icons', file:'add.png')}"><g:link action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
		</div>
		<div class="body">
			<!--<h1><g:message code="default.list.label" args="[entityName]" /></h1>-->
			<g:if test="${flash.message}">
				<div class="message canhide">${flash.message}</div>
			</g:if>
			<div class="list">
				<table id="myTable" class="tablesorter">
					<thead>
						<tr>
              <%--<g:sortableColumn property="id" title="${message(code: 'atendimentoExterno.id.label', default: 'Id')}" />--%>
              <th><g:message code="atendimentoExterno.chamado.label" default="Chamado" /></th>
              <th><g:message code="atendimentoExterno.assistencia_tecnica.label" default="Assistência técnica" /></th>
              <g:sortableColumn property="data_saida" title="${message(code: 'atendimentoExterno.data_saida.label', default: 'Data de saída')}" />
              <g:sortableColumn property="descricao" title="${message(code: 'atendimentoExterno.descricao.label', default: 'Descrição')}" />
              <g:sortableColumn property="custo" title="${message(code: 'atendimentoExterno.custo.label', default: 'Custo')}" />
              <th class="acao">Ações</th>
            </tr>
					</thead>
					<tbody>
					<g:each in="${atendimentoExternoInstanceList}" status="i" var="atendimentoExternoInstance">
						<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
							<!--<td><g:link action="show" id="${atendimentoExternoInstance.id}">${fieldValue(bean: atendimentoExternoInstance, field: "id")}</g:link></td>-->
							<td>${fieldValue(bean: atendimentoExternoInstance, field: "chamado")}</td>
							<td>${fieldValue(bean: atendimentoExternoInstance, field: "assistencia_tecnica")}</td>
							<td><g:formatDate date="${atendimentoExternoInstance.data_saida}" format="dd/MM/yyyy 'às' HH'h'mm" /></td>
							<td class="textoquebrado">${fieldValue(bean: atendimentoExternoInstance, field: "descricao")}</td>
							<td>${fieldValue(bean: atendimentoExternoInstance, field: "custo")}</td>
							<td>
							<g:form>
								<g:link action="show" id="${atendimentoExternoInstance.id}">
									<img src="${resource(dir:'images/icons', file:'view.png')}">
								</g:link>
								<g:link action="edit" id="${atendimentoExternoInstance.id}">
									<img src="${resource(dir:'images/icons', file:'edit.png')}">
								</g:link>
								<g:hiddenField name="id" value="${atendimentoExternoInstance.id}" />
								<g:actionSubmitImage src="${resource(dir:'images/icons', file:'delete.png')}" class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
							</g:form>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
			<div class="paginateButtons">
				<g:paginate total="${atendimentoExternoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
