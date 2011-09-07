
<%@ page import="sigesti.Assentamento" %>
<%@ page import="sigesti.Chamado" %>
<%@ page import="sigesti.Status" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'chamado.label', default: 'Chamado')}" />
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
        <div class="message canhide">${flash.message}</div>
      </g:if>
      <div class="dialog">
        <table id="myTable" class="tableview">
          <tbody>
            <tr class="prop odd">
              <td class="name"><g:message code="chamado.id.label" default="Número" /></td>
              <td class="value">${fieldValue(bean: chamadoInstance, field: "id")}</td>
            </tr>
            <tr class="prop even">
              <td class="name"><g:message code="chamado.desc_problema.label" default="Descrição do Problema" /></td>
              <td class="value">${fieldValue(bean: chamadoInstance, field: "desc_problema")}</td>
            </tr>
            <tr class="prop odd">
              <td class="name"><g:message code="chamado.data_abertura.label" default="Data de Abertura" /></td>
              <td class="value"><g:formatDate date="${chamadoInstance?.data_abertura}" format="dd/MM/yyyy 'às' HH'h'mm" /></td>
            </tr>
            <tr class="prop even">
              <td class="name"><g:message code="chamado.data_encerramento.label" default="Data de Encerramento" /></td>
              <td class="value"><g:formatDate date="${chamadoInstance?.data_encerramento}" format="dd/MM/yyyy 'às' HH'h'mm" /></td>
            </tr>
            <tr class="prop odd">
              <td class="name"><g:message code="chamado.desc_chamado.label" default="Descrição do Chamado" /></td>
              <td class="value">${fieldValue(bean: chamadoInstance, field: "desc_chamado")}</td>
            </tr>
            <tr class="prop even">
              <td class="name"><g:message code="chamado.area_responsavel.label" default="Área Responsável" /></td>
              <td class="value"><g:link controller="areaResponsavel" action="show" id="${chamadoInstance?.area_responsavel?.id}">${chamadoInstance?.area_responsavel?.encodeAsHTML()}</g:link></td>
            </tr>
            <tr class="prop odd">
              <td class="name"><g:message code="chamado.operador.label" default="Operador" /></td>
              <td class="value"><g:link controller="usuario" action="show" id="${chamadoInstance?.operador?.id}">${chamadoInstance?.operador?.encodeAsHTML()}</g:link></td>
            </tr>
            <tr class="prop even">
              <td class="name"><g:message code="chamado.usuario.label" default="Usuário" /></td>
              <td class="value"><g:link controller="usuario" action="show" id="${chamadoInstance?.usuario?.id}">${chamadoInstance?.usuario?.encodeAsHTML()}</g:link></td>
            </tr>
            <!--<tr class="prop odd">
              <td class="name"><g:message code="chamado.problema.label" default="Problema" /></td>
              <td class="value"><g:link controller="problema" action="show" id="${chamadoInstance?.problema?.id}">${chamadoInstance?.problema?.encodeAsHTML()}</g:link></td>
            </tr>-->
            <tr class="prop odd">
              <td class="name"><g:message code="chamado.desc_solucao.label" default="Solução" /></td>
              <td class="value">${fieldValue(bean: chamadoInstance, field: "desc_solucao")}</td>
            </tr>
            <tr class="prop even">
              <td class="name"><g:message code="chamado.equipamento.label" default="Equipamento" /></td>
              <td class="value"><g:link controller="equipamento" action="show" id="${chamadoInstance?.equipamento?.id}">${chamadoInstance?.equipamento?.encodeAsHTML()}</g:link></td>
            </tr>

            <tr class="prop odd">
              <td class="name"><g:message code="assentamento.descricao.label" default="Assentamentos" /></td>
              <td class="value">
                <ul>
                  <g:each in="${Assentamento.findAllByChamado(chamadoInstance)}" status="a" var="assentamentoInstance">
                    <li>${fieldValue(bean: assentamentoInstance, field: "descricao")}</li>
                  </g:each>
                </ul>
              </td>
            </tr>

						<tr class="prop even">
							<td class="name"><g:message code="status.tipo_status.label" default="Status" /></td>
						<td class="value">
						  <ul>
							  <g:each in="${Status.findAllByChamado(chamadoInstance)}" status="s" var="statusInstance">
							    <li>
							      ${fieldValue(bean: statusInstance, field: "tipo_status")}:
							      ${statusInstance?.data_inicial?.format("HH'h'mm 'de' dd/MM/yyyy")}
                    <g:if test="${statusInstance.data_inicial != statusInstance.data_final}">
                      <g:if test="${!statusInstance?.data_final.equals(null)}">
                        ${' à ' + statusInstance?.data_final?.format("HH'h'mm 'de' dd/MM/yyyy")}
                      </g:if>
                      <g:else>
                        ${' até o presente momento.'}
                      </g:else>
                    </g:if>
						      </li>
							  </g:each>
						  </ul>
						</td>
						</tr>

          </tbody>
        </table>
      </div>
      <div class="buttons" align="center">
        <g:form>
					<g:if test="${!session?.usuario?.nivel?.equals('Usuario')}">
					<g:hiddenField name="id" value="${chamadoInstance?.id}" />
					<g:actionSubmit class="button-edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" onclick="return confirm('${message(code: 'default.button.edit.confirm.message', default: 'Are you sure?')}');" />
					<g:actionSubmit class="button-delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /><br />
					<g:actionSubmit class="button" action="atendechamado" value="${message(code: 'default.button.atende.label', default: 'Atender')}" onclick="return confirm('${message(code: 'default.button.atende.confirm.message', default: 'Are you sure?')}');" />
					<g:actionSubmit class="button" action="retirarequipamento" value="${message(code: 'default.button.retirar.label', default: 'Retirar')}" onclick="return confirm('${message(code: 'default.button.retirar.confirm.message', default: 'Are you sure?')}');" />
					<g:actionSubmit class="button" action="diagnosticar" value="${message(code: 'default.button.diagnostica.label', default: 'Diagnosticar')}" onclick="return confirm('${message(code: 'default.button.diagnostica.confirm.message', default: 'Are you sure?')}');" />
					<g:actionSubmit class="button" action="observar" value="${message(code: 'default.button.observacao.label', default: 'Observar')}" onclick="return confirm('${message(code: 'default.button.observacao.confirm.message', default: 'Are you sure?')}');" />
					<g:actionSubmit class="button" action="devolver" value="${message(code: 'default.button.devolveraousuario.label', default: 'Devolver')}" onclick="return confirm('${message(code: 'default.button.devolveraousuario.confirm.message', default: 'Are you sure?')}');" />
					<g:actionSubmit class="button" action="encerrachamado" value="${message(code: 'default.button.encerra.label', default: 'Encerrar')}" onclick="return confirm('${message(code: 'default.button.encerra.confirm.message', default: 'Are you sure?')}');" />
					<g:actionSubmit class="button" action="reabrirchamado" value="${message(code: 'default.button.reabrirchamado.label', default: 'Reabrir')}" onclick="return confirm('${message(code: 'default.button.reabrirchamado.confirm.message', default: 'Are you sure?')}');" />
          </g:if>
        </g:form>
      </div>
    </div>
  </body>
</html>
