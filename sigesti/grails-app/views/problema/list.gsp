
<%@ page import="sigesti.Problema" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'problema.label', default: 'Problema')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:javascript library="jquery" plugin="jquery" />
		<g:javascript src="jquery-ui-1.8.13.custom.min.js" />
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
              <%--<g:sortableColumn property="id" title="${message(code: 'problema.id.label', default: 'Id')}" />--%>
              <g:sortableColumn property="descricao" title="${message(code: 'problema.descricao.label', default: 'Descrição')}" />
              <%--<g:sortableColumn property="possivel_causa" title="${message(code: 'problema.possivel_causa.label', default: 'Possivelcausa')}" />--%>
              <th><g:message code="problema.area_responsavel.label" default="Área responsável" /></th>
              <th><g:message code="problema.sla.label" default="SLA" /></th>
              <th><g:message code="problema.solucao.label" default="Solução" /></th>
              <th class="acao">Ações</th>
            </tr>
          </thead>
          <tbody>
          <g:each in="${problemaInstanceList}" status="i" var="problemaInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
              <%--<td><g:link action="show" id="${problemaInstance.id}">${fieldValue(bean: problemaInstance, field: "id")}</g:link></td>--%>
              <td>${fieldValue(bean: problemaInstance, field: "descricao")}</td>
              <%--<td>${fieldValue(bean: problemaInstance, field: "possivel_causa")}</td>--%>
              <td>${fieldValue(bean: problemaInstance, field: "area_responsavel")}</td>
              <td>${fieldValue(bean: problemaInstance, field: "sla")}</td>
              <td>${fieldValue(bean: problemaInstance, field: "solucao")}</td>
              <td>
                <g:form>
                  <g:link action="show" id="${problemaInstance.id}">
                    <img src="${resource(dir:'images/icons', file:'view.png')}">
                  </g:link>
                  <g:link action="edit" id="${problemaInstance.id}">
                    <img src="${resource(dir:'images/icons', file:'edit.png')}">
                  </g:link>
                  <g:hiddenField name="id" value="${problemaInstance.id}" />
                  <g:actionSubmitImage src="${resource(dir:'images/icons', file:'delete.png')}" class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </g:form>
              </td>
            </tr>
          </g:each>
          </tbody>
        </table>
      </div>
      <div class="paginateButtons">
        <g:paginate total="${problemaInstanceTotal}" />
      </div>
    </div>
  </body>
</html>
