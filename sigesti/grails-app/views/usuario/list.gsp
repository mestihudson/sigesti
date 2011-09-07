
<%@ page import="sigesti.Usuario" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<g:javascript library="jquery" plugin="jquery" />
		<g:javascript src="jquery-ui-1.8.13.custom.min.js" />
		<g:javascript src="truncatexto.js" />
		<g:javascript>
			truncar((document.getElementsByClassName('textoquebrado').[0].innerHTML), 6);
		</g:javascript>
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
							<%--<g:sortableColumn property="id" title="${message(code: 'usuario.id.label', default: 'Id')}" />--%>
					<g:sortableColumn property="nome" title="${message(code: 'usuario.nome.label', default: 'Nome')}" />
					<%--<g:sortableColumn property="senha" title="${message(code: 'usuario.senha.label', default: 'Senha')}" />--%>
					<g:sortableColumn property="email" title="${message(code: 'usuario.email.label', default: 'Email')}" />
					<g:sortableColumn property="data_cadastro" title="${message(code: 'usuario.data_cadastro.label', default: 'Data de cadastro')}" />
					<g:sortableColumn property="nivel" title="${message(code: 'usuario.nivel.label', default: 'Nível')}" />
					<th class="acao">Ações</th>
					</tr>
					</thead>
					<tbody>
					<g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
						<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
							<%--<td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "id")}</g:link></td>--%>
							<td class="textoquebrado">${fieldValue(bean: usuarioInstance, field: "nome")}</td>
							<%--<td>${fieldValue(bean: usuarioInstance, field: "senha")}</td>--%>
							<td>${fieldValue(bean: usuarioInstance, field: "email")}</td>
							<td><g:formatDate date="${usuarioInstance.data_cadastro}" format="dd/MM/yyyy 'às' HH'h'mm" /></td>
							<td>${fieldValue(bean: usuarioInstance, field: "nivel")}</td>
							<td>
								<g:form>
									<g:link action="show" id="${usuarioInstance.id}">
										<img src="${resource(dir:'images/icons', file:'view.png')}">
									</g:link>
									<g:link action="edit" id="${usuarioInstance.id}">
										<img src="${resource(dir:'images/icons', file:'edit.png')}">
									</g:link>
									<g:hiddenField name="id" value="${usuarioInstance.id}" />
									<g:actionSubmitImage src="${resource(dir:'images/icons', file:'delete.png')}" class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
								</g:form>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
			<div class="paginateButtons">
				<g:paginate total="${usuarioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
