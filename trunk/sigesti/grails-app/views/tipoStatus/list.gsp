
<%@ page import="sigesti.TipoStatus" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'tipoStatus.label', default: 'TipoStatus')}" />
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
              <%--<g:sortableColumn property="id" title="${message(code: 'tipoStatus.id.label', default: 'Id')}" />--%>
              <g:sortableColumn property="descricao" title="${message(code: 'tipoStatus.descricao.label', default: 'Descrição')}" />
              <th class="acao">Ações</th>
            </tr>
          </thead>
          <tbody>
            <g:each in="${tipoStatusInstanceList}" status="i" var="tipoStatusInstance">
              <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                <%--<td><g:link action="show" id="${tipoStatusInstance.id}">${fieldValue(bean: tipoStatusInstance, field: "id")}</g:link></td>--%>
                <td>${fieldValue(bean: tipoStatusInstance, field: "descricao")}</td>
                <td>
                  <g:form>
                    <g:link action="show" id="${tipoStatusInstance.id}">
                      <img src="${resource(dir:'images/icons', file:'view.png')}">
                    </g:link>
                    <g:link action="edit" id="${tipoStatusInstance.id}">
                      <img src="${resource(dir:'images/icons', file:'edit.png')}">
                    </g:link>
                    <g:hiddenField name="id" value="${tipoStatusInstance.id}" />
                    <g:actionSubmitImage src="${resource(dir:'images/icons', file:'delete.png')}" class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                  </g:form>
                </td>
              </tr>
            </g:each>
          </tbody>
        </table>
      </div>
      <div class="paginateButtons">
        <g:paginate total="${tipoStatusInstanceTotal}" />
      </div>
    </div>
  </body>
</html>
