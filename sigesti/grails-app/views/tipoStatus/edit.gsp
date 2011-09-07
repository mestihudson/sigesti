
<%@ page import="sigesti.TipoStatus" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'tipoStatus.label', default: 'TipoStatus')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
    <g:javascript library="jquery" plugin="jquery" />
    <g:javascript src="jquery.maskedinput-1.3.min.js" />
    <g:javascript src="jquery.placeholder.js" />
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
      <g:hasErrors bean="${tipoStatusInstance}">
        <div class="errors canhide">
          <g:renderErrors bean="${tipoStatusInstance}" as="list" />
        </div>
      </g:hasErrors>
      <g:form method="post" onsubmit="\$('[placeholder]').placeholder('clear');" >
        <g:hiddenField name="id" value="${tipoStatusInstance?.id}" />
        <g:hiddenField name="version" value="${tipoStatusInstance?.version}" />
        <div class="dialog">
          <p>
            <label for="descricao"><g:message code="tipoStatus.descricao.label" default="Descrição" /></label>
            <g:textField name="descricao" maxlength="64" value="${tipoStatusInstance?.descricao}" class="value ${hasErrors(bean: tipoStatusInstance, field: 'descricao', 'errors')}" placeholder="descrição" />
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
