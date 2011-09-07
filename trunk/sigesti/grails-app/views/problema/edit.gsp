
<%@ page import="sigesti.Problema" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'problema.label', default: 'Problema')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
    <g:javascript library="jquery" plugin="jquery" />
    <g:javascript src="jquery.placeholder.js" />
    <g:javascript src="textarealimiter.js" />
    <g:javascript>
      jQuery.noConflict();
      $(document).ready(function() {
        $('[placeholder]').placeholder();
      });
    </g:javascript>
  </head>
  <body>
    <div class="nav">
      <img src="${resource(dir:'images/icons', file:'home_32.png')}"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
      <img src="${resource(dir:'images/icons', file:'list.png')}"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link>
      <img src="${resource(dir:'images/icons', file:'add.png')}"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
    </div>
    <div class="body">
      <!--<h1><g:message code="default.edit.label" args="[entityName]" /></h1>-->
      <g:if test="${flash.message}">
        <div class="message canhide">${flash.message}</div>
      </g:if>
      <g:hasErrors bean="${problemaInstance}">
        <div class="errors canhide">
          <g:renderErrors bean="${problemaInstance}" as="list" />
        </div>
      </g:hasErrors>
      <g:form method="post" onsubmit="\$('[placeholder]').placeholder('clear');" >
        <g:hiddenField name="id" value="${problemaInstance?.id}" />
        <g:hiddenField name="version" value="${problemaInstance?.version}" />
        <div class="dialog">
          <p>
            <label for="descricao"><g:message code="problema.descricao.label" default="Descrição" /></label>
            <g:textArea onkeydown="progresso_tecla(this.id)" onkeyup="progresso_tecla(this.id)" name="descricao" id="descricao" class="value ${hasErrors(bean: problemaInstance, field: 'descricao', 'errors')}" value="${problemaInstance?.descricao}" placeholder="descricao" />
						<div id="descricao_restantes" class="restantes">Caracteres restantes: 1024</div>

            <label for="possivel_causa"><g:message code="problema.possivel_causa.label" default="Possível causa" /></label>
            <g:textArea onkeydown="progresso_tecla(this.id)" onkeyup="progresso_tecla(this.id)" name="possivel_causa" id="possivel_causa" class="value ${hasErrors(bean: problemaInstance, field: 'possivel_causa', 'errors')}" value="${problemaInstance?.possivel_causa}" placeholder="possível causa" />
            <div id="possivel_causa_restantes" class="restantes">Caracteres restantes: 1024</div>

            <label for="area_responsavel"><g:message code="problema.area_responsavel.label" default="Área responsável" /></label>
            <g:select name="area_responsavel.id" noSelection="['null': '--Selecione--']" class="value ${hasErrors(bean: problemaInstance, field: 'area_responsavel', 'errors')}" from="${sigesti.AreaResponsavel.list()}" optionKey="id" value="${problemaInstance?.area_responsavel?.id}"  />
            <label for="sla"><g:message code="problema.sla.label" default="SLA" /></label>
            <g:select name="sla.id" noSelection="['null': '--Selecione--']" class="value ${hasErrors(bean: problemaInstance, field: 'sla', 'errors')}" from="${sigesti.SLA.list()}" optionKey="id" value="${problemaInstance?.sla?.id}" />
            <label for="solucao"><g:message code="problema.solucao.label" default="Solução" /></label>
            <g:select name="solucao.id" noSelection="['null': '--Selecione--']" class="value ${hasErrors(bean: problemaInstance, field: 'solucao', 'errors')}" from="${sigesti.Solucao.list()}" optionKey="id" value="${problemaInstance?.solucao?.id}" />
          </p>
        </div>
        <div class="buttons">
          <g:actionSubmit class="button-update" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
          <g:actionSubmit class="button-delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}"
            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </div>
      </g:form>
    </div>
  </body>
</html>
