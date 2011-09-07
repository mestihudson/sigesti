
<%@ page import="sigesti.Chamado" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'chamado.label', default: 'Chamado')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
		<g:javascript src="jquery.placeholder.js" />
		<g:javascript src="textarealimiter.js" />
		<g:javascript>
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
      <g:hasErrors bean="${chamadoInstance}">
        <div class="errors canhide">
          <g:renderErrors bean="${chamadoInstance}" as="list" />
        </div>
      </g:hasErrors>
      <g:form method="post" onsubmit="\$('[placeholder]').placeholder('clear');" >
        <g:hiddenField name="id" value="${chamadoInstance?.id}" />
        <g:hiddenField name="version" value="${chamadoInstance?.version}" />
        <div class="dialog">
          <p>
            <label for="desc_problema"><g:message code="chamado.desc_problema.label" default="Descrição do problema" /></label>
            <g:textArea onkeydown="progresso_tecla(this.id)" onkeyup="progresso_tecla(this.id)" name="desc_problema" id="desc_problema" class="value ${hasErrors(bean: chamadoInstance, field: 'desc_problema', 'errors')}" value="${chamadoInstance?.desc_problema}" placeholder="descrição do problema" />
            <div id="desc_problema_restantes" class="restantes">Caracteres restantes: 1024</div>

            <label for="data_abertura"><g:message code="chamado.data_abertura.label" default="Data de abertura" /></label>
            <g:textField id="data_abertura" name="data_abertura" class="value ${hasErrors(bean: chamadoInstance, field: 'data_abertura', 'errors')}" value="${chamadoInstance?.data_abertura?.format('dd/MM/yyyy')}" placeholder="data de abertura" readonly="readonly" disabled="disabled" />

            <label for="data_encerramento"><g:message code="chamado.data_encerramento.label" default="Data de encerramento" /></label>
            <g:textField id="data_encerramento" name="data_encerramento" class="value ${hasErrors(bean: chamadoInstance, field: 'data_encerramento', 'errors')}" value="${chamadoInstance?.data_encerramento?.format('dd/MM/yyyy')}" placeholder="data de encerramento" readonly="readonly" disabled="disabled" />

            <label for="desc_chamado"><g:message code="chamado.desc_chamado.label" default="Descchamado" /></label>
            <g:textArea onkeydown="progresso_tecla(this.id)" onkeyup="progresso_tecla(this.id)" name="desc_chamado" id="desc_chamado" class="value ${hasErrors(bean: chamadoInstance, field: 'desc_chamado', 'errors')}" value="${chamadoInstance?.desc_chamado}" placeholder="descrição do chamado" />
            <div id="desc_chamado_restantes" class="restantes">Caracteres restantes: 1024</div>

            <label for="area_responsavel"><g:message code="chamado.area_responsavel.label" default="Área Responsável" /></label>
            <g:select name="area_responsavel.id" noSelection="['null': '--Selecione--']" class="value ${hasErrors(bean: chamadoInstance, field: 'area_responsavel', 'errors')}" from="${sigesti?.AreaResponsavel?.list()}" optionKey="id" value="${chamadoInstance?.area_responsavel?.id}" />

            <label for="operador"><g:message code="chamado.operador.label" default="Operador" /></label>
            <g:select name="operador.id" noSelection="['null': '--Selecione--']" class="value ${hasErrors(bean: chamadoInstance, field: 'operador', 'errors')}" from="${sigesti.Usuario.findAllByNivelNotEqual('Usuario')}" optionKey="id" value="${chamadoInstance?.operador?.id}" />

            <label for="usuario"><g:message code="chamado.usuario.label" default="Usuário" /></label>
            <g:select name="usuario.id" noSelection="['null': '--Selecione--']" class="value ${hasErrors(bean: chamadoInstance, field: 'usuario', 'errors')}" from="${sigesti?.Usuario?.list()}" optionKey="id" value="${chamadoInstance?.usuario?.id}"  />

            <label for="problema"><g:message code="chamado.problema.label" default="Problema" /></label>
            <g:select name="problema.id" noSelection="['null': '--Selecione--']" class="value ${hasErrors(bean: chamadoInstance, field: 'problema', 'errors')}" from="${sigesti?.Problema?.list()}" optionKey="id" value="${chamadoInstance?.problema?.id}" />

            <label for="desc_solucao"><g:message code="chamado.desc_solucao.label" default="Descrição da solução" /></label>
            <g:textArea onkeydown="progresso_tecla(this.id)" onkeyup="progresso_tecla(this.id)" name="desc_solucao" id="desc_solucao" class="value ${hasErrors(bean: chamadoInstance, field: 'desc_solucao', 'errors')}" value="${chamadoInstance?.desc_solucao}" placeholder="descrição da solucao" />
            <div id="desc_solucao_restantes" class="restantes">Caracteres restantes: 1024</div>

            <label for="equipamento"><g:message code="chamado.equipamento.label" default="Equipamento" /></label>
            <g:select name="equipamento.id" noSelection="['null': '--Selecione--']" class="value ${hasErrors(bean: chamadoInstance, field: 'equipamento', 'errors')}" from="${sigesti.Equipamento.findAllByDisponibilidadeNotEqual(false)}" optionKey="id" value="${chamadoInstance?.equipamento?.id}" />


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
