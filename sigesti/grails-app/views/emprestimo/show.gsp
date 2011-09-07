
<%@ page import="sigesti.Emprestimo" %>
<%@ page import="sigesti.Equipamento" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'emprestimo.label', default: 'Emprestimo')}" />
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
            <td class="name"><g:message code="emprestimo.id.label" default="Id" /></td>
            <td class="value">${fieldValue(bean: emprestimoInstance, field: "id")}</td>
          </tr>

          <tr class="prop even">
            <td class="name"><g:message code="emprestimo.data_emprestimo.label" default="Data de emprestimo" /></td>
            <td class="value"><g:formatDate date="${emprestimoInstance?.data_emprestimo}" format="dd/MM/yyyy" /></td>
          </tr>

          <tr class="prop odd">
            <td class="name"><g:message code="emprestimo.data_limite.label" default="Data limite de devolução" /></td>
            <td class="value"><g:formatDate date="${emprestimoInstance?.data_limite}" format="dd/MM/yyyy" /></td>
          </tr>

          <tr class="prop even">
            <td class="name"><g:message code="emprestimo.data_devolucao.label" default="Data de devolução" /></td>
            <td class="value"><g:formatDate date="${emprestimoInstance?.data_devolucao}" format="dd/MM/yyyy" /></td>
          </tr>        

          <tr class="prop odd">
            <td class="name"><g:message code="emprestimo.justificativa.label" default="Justificativa" /></td>
            <td class="value">${fieldValue(bean: emprestimoInstance, field: "justificativa")}</td>
          </tr>

          <tr class="prop even">
            <td class="name"><g:message code="emprestimo.observacao.label" default="Observação" /></td>
            <td class="value">${fieldValue(bean: emprestimoInstance, field: "observacao")}</td>
          </tr>

          <tr class="prop odd">
            <td class="name"><g:message code="emprestimo.equipamento.label" default="Equipamento" /></td>
            <td class="value"><g:link controller="equipamento" action="show" id="${emprestimoInstance?.equipamento?.id}">${emprestimoInstance?.equipamento?.encodeAsHTML()}</g:link></td>
          </tr>

          <tr class="prop even">
            <td class="name"><g:message code="equipamento.patrimonio.label" default="Patrimônio" /></td>
            <td class="value"><g:link controller="equipamento" action="show" id="${emprestimoInstance?.equipamento?.id}">${emprestimoInstance?.equipamento?.patrimonio?.encodeAsHTML()}</g:link></td>
          </tr>

          <tr class="prop odd">
            <td class="name"><g:message code="emprestimo.responsavel.label" default="Responsável" /></td>
            <td class="value"><g:link controller="usuario" action="show" id="${emprestimoInstance?.responsavel?.id}">${emprestimoInstance?.responsavel?.encodeAsHTML()}</g:link></td>
          </tr>

          <tr class="prop even">
            <td class="name"><g:message code="emprestimo.solicitante.label" default="Solicitante" /></td>
            <td class="value"><g:link controller="usuario" action="show" id="${emprestimoInstance?.solicitante?.id}">${emprestimoInstance?.solicitante?.encodeAsHTML()}</g:link></td>
          </tr>

          <tr class="prop odd">
            <td class="name"><g:message code="equipamento.disponibilidade.label" default="Disponibilidade" /></td>
            <td class="value">${ emprestimoInstance?.equipamento?.disponibilidade ? 'disponível': 'indisponível'}</td>
          </tr>

        </tbody>
      </table>
    </div>
    <div class="buttons">
      <g:form>
        <g:hiddenField name="id" value="${emprestimoInstance?.id}" />
        <g:actionSubmit class="button-edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
        <g:actionSubmit class="button-delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        <g:actionSubmit class="button" action="devolveremprestimo" value="${message(code: 'default.button.devolveremprestimo.label', default: 'Devolver')}" onclick="return confirm('${message(code: 'default.button.devolveremprestimo.confirm.message', default: 'Are you sure?')}');" />
      </g:form>
    </div>
  </div>
</body>
</html>
