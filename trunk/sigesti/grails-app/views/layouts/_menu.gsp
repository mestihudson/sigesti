<g:if test="${session?.usuario?.nivel?.equals('Administrador')}">
	<g:render template="/layouts/menuadministrador" />
	<g:render template="/layouts/menuoperador" />
</g:if>

<g:if test="${session?.usuario?.nivel?.equals('Operador')}">
	<g:render template="/layouts/menuoperador" />
</g:if>

<li><img src="${resource(dir:'images', file:'mainicons/chamado.png')}" alt="Settings" class="png_bg" />
	<g:link controller="chamado" action="list">Chamado</g:link><br />
	<p>Chamado</p>
</li>
