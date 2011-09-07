
<%@ page import="sigesti.Emprestimo" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'emprestimo.label', default: 'Emprestimo')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
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
              <%--<g:sortableColumn property="id" title="${message(code: 'emprestimo.id.label', default: 'Id')}" />--%>
              <g:sortableColumn property="data_emprestimo" title="${message(code: 'emprestimo.data_emprestimo.label', default: 'Data empréstimo')}" />
              <g:sortableColumn property="data_limite" title="${message(code: 'emprestimo.data_limite.label', default: 'Data devolução')}" />
              <g:sortableColumn property="data_devolucao" title="${message(code: 'emprestimo.data_devolucao.label', default: 'Devolvido')}" />
              <%--<g:sortableColumn property="justificativa" title="${message(code: 'emprestimo.justificativa.label', default: 'Justificativa')}" />--%>
              <%--<g:sortableColumn property="observacao" title="${message(code: 'emprestimo.observacao.label', default: 'Observação')}" />--%>
              <th><g:message code="emprestimo.equipamento.label" default="Equipamento" /></th>
              <th class="acao">Ações</th>
            </tr>
          </thead>
          <tbody>
          <g:each in="${emprestimoInstanceList}" status="i" var="emprestimoInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
              <%--<td><g:link action="show" id="${emprestimoInstance.id}">${fieldValue(bean: emprestimoInstance, field: "id")}</g:link></td>--%>
              <td><g:formatDate date="${emprestimoInstance.data_emprestimo}" format="dd/MM/yyyy" /></td>
              <td><g:formatDate date="${emprestimoInstance.data_limite}" format="dd/MM/yyyy" /></td>
              <td><g:formatDate date="${emprestimoInstance.data_devolucao}" format="dd/MM/yyyy" /></td>
              <%--<td>${fieldValue(bean: emprestimoInstance, field: "justificativa")}</td>--%>
              <%--<td>${fieldValue(bean: emprestimoInstance, field: "observacao")}</td>--%>
              <td>${fieldValue(bean: emprestimoInstance, field: "equipamento")}</td>
              <td>
            <g:form>
              <g:link action="show" id="${emprestimoInstance.id}">
                <img src="${resource(dir:'images/icons', file:'view.png')}">
              </g:link>
              <g:link action="edit" id="${emprestimoInstance.id}">
                <img src="${resource(dir:'images/icons', file:'edit.png')}">
              </g:link>
              <g:hiddenField name="id" value="${emprestimoInstance.id}" />
              <g:actionSubmitImage src="${resource(dir:'images/icons', file:'delete.png')}" class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </g:form>
            </td>
            </tr>
          </g:each>
          </tbody>
        </table>
      </div>
      <div class="paginateButtons">
        <g:paginate total="${emprestimoInstanceTotal}" />
      </div>
    </div>
  </body>
</html>
