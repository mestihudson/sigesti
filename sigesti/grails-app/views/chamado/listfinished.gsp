
<%@ page import="sigesti.Chamado" %>
<%@ page import="sigesti.Status" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'chamado.label', default: 'Chamado')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
  <g:javascript src="truncatexto.js" />
</head>
<body>
  <div class="nav">
    <img src="${resource(dir:'images/icons', file:'home_32.png')}"><a href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    <img src="${resource(dir:'images/icons', file:'add.png')}"><g:link action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
    <img src="${resource(dir:'images/icons', file:'list.png')}" /><g:link class="list" action="list"><g:message code="default.listchamado.label" args="[entityName]" /></g:link>
    <img src="${resource(dir:'images/icons', file:'waiting.png')}" /><g:link class="list" action="listwaiting"><g:message code="default.listwaiting.label" args="[entityName]" /></g:link>
    <img src="${resource(dir:'images/icons', file:'meeting.png')}" /><g:link class="list" action="listmeeting"><g:message code="default.listmeeting.label" args="[entityName]" /></g:link>
    <img src="${resource(dir:'images/icons', file:'finished.png')}" /><g:link class="list" action="listfinished"><g:message code="default.listfinished.label" args="[entityName]" /></g:link>
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
        <g:sortableColumn property="id" title="${message(code: 'chamado.id.label', default: 'Número')}" />
          <%--<g:sortableColumn property="desc_problema" title="${message(code: 'chamado.desc_problema.label', default: 'Problema')}" />--%>
        <g:sortableColumn property="data_abertura" title="${message(code: 'chamado.data_abertura.label', default: 'Abertura')}" />
          <%--<g:sortableColumn property="data_encerramento" title="${message(code: 'chamado.data_encerramento.label', default: 'Encerramento')}" />--%>
        <g:sortableColumn property="desc_chamado" title="${message(code: 'chamado.desc_chamado.label', default: 'Descrição')}" />
          <%--<th><g:message code="chamado.area_responsavel.label" default="Arearesponsavel" /></th>--%>
        <th><g:message code="status.tipo_status.label" default="Status" /></th>
        <g:if test="${!session?.usuario?.nivel?.equals('Usuario')}">
          <th class="acao">Ações</th>
        </g:if>
        <g:else>
          <th class="acao">Ver</th>
        </g:else>
        </tr>
        </thead>
        <tbody>
        <g:each in="${chamadoInstanceListFinished}" status="i" var="chamadoInstance">
          <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
            <td><g:link action="show" id="${chamadoInstance.id}">${fieldValue(bean: chamadoInstance, field: "id")}</g:link></td>
            <%--<td>${fieldValue(bean: chamadoInstance, field: "desc_problema")}</td>--%>
          <td><g:formatDate date="${chamadoInstance.data_abertura}" format="dd/MM/yyyy 'às' HH'h'mm" /></td>
            <%--<td><g:formatDate date="${chamadoInstance.data_encerramento}" /></td>--%>
          <td class="textoquebrado">
            ${fieldValue(bean: chamadoInstance, field: "desc_chamado")}
          </td>
            <%--<td>${fieldValue(bean: chamadoInstance, field: "area_responsavel")}</td>--%>
          <td>
            ${Status.executeQuery("select s.tipo_status from Status s where s.chamado = ? and s.id in (select max(s.id) from Status s group by s.chamado)", [chamadoInstance])[0]}
          </td>
          <td>
          <g:form>
            <g:link action="show" id="${chamadoInstance.id}">
              <img src="${resource(dir:'images/icons', file:'view.png')}">
            </g:link>
            <g:if test="${!session?.usuario?.nivel?.equals('Usuario')}">
              <g:link action="edit" id="${chamadoInstance.id}">
                <img src="${resource(dir:'images/icons', file:'edit.png')}">
              </g:link>
              <g:hiddenField name="id" value="${chamadoInstance.id}" />
              <g:actionSubmitImage src="${resource(dir:'images/icons', file:'delete.png')}" class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </g:if>
          </g:form>
          </td>
          </tr>
        </g:each>
        </tbody>
      </table>
    </div>
    <div class="paginateButtons">
      <g:paginate total="${chamadoInstanceTotal}" />
    </div>
  </div>
</body>
</html>
