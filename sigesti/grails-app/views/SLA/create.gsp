
<%@ page import="sigesti.SLA" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'SLA.label', default: 'SLA')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>
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
      <img src="${resource(dir:'images/icons', file:'home_32.png')}" /><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
      <img src="${resource(dir:'images/icons', file:'list.png')}" /><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link>
    </div>
    <div class="body">
      <!--<h1><g:message code="default.create.label" args="[entityName]" /></h1>-->
      <g:if test="${flash.message}">
        <div class="message canhide">${flash.message}</div>
      </g:if>
      <g:hasErrors bean="${SLAInstance}">
        <div class="errors canhide">
          <g:renderErrors bean="${SLAInstance}" as="list" />
        </div>
      </g:hasErrors>
      <g:form action="save" onsubmit="\$('[placeholder]').placeholder('clear');" >
        <div class="dialog">
          <p>
            <label for="descricao"><g:message code="SLA.descricao.label" default="Descrição" /></label>
            <g:textField name="descricao" maxlength="64" value="${SLAInstance?.descricao}" class="value ${hasErrors(bean: SLAInstance, field: 'descricao', 'errors')}" placeholder="descrição" />
            <label for="tempo"><g:message code="SLA.tempo.label" default="Tempo" /></label>
            <g:textField name="tempo" class="value ${hasErrors(bean: SLAInstance, field: 'tempo', 'errors')}" value="${fieldValue(bean: SLAInstance, field: 'tempo')}" placeholder="tempo" />
          </p>
        </div>
        <div class="buttons">
          <g:submitButton name="create" class="button-create" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </div>
      </g:form>
    </div>
  </body>
</html>
