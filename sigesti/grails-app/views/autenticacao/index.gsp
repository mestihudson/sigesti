<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <title>SIGESTI - Sistema de Gerenciamento de Suporte em Tecnologia da Informação</title>
    <g:set var="entityName" value="${message(code: 'autenticacao.label', default: 'Autenticacao')}" />
    <link rel="shortcut icon" href="${resource(dir:'images',file:'mainicons/chamado.png')}" type="image/x-icon" />
		<g:javascript library="jquery" plugin="jquery" />
		<g:javascript src="jquery-ui-1.8.13.custom.min.js" />
		<g:javascript src="jquery.placeholder.js" />
		<g:javascript src="ui_scripts.js" />
		<g:javascript>
			$(document).ready(function() {
				$('[placeholder]').placeholder();
			});
		</g:javascript>

		<!-- Import Master CSS File  -->
		<link href="${resource(dir:'css',file:'styles.css')}" rel="stylesheet" type="text/css" />
		<!--[if lte IE 6]>
				<script type="text/javascript" src="js/ddpng.js"></script>
				<script type="text/javascript">
					DD_belatedPNG.fix('#header');
					DD_belatedPNG.fix('#navigation img');
									DD_belatedPNG.fix('#logo img');
					DD_belatedPNG.fix('.tabNavigation');
					DD_belatedPNG.fix('.png_bg');
					DD_belatedPNG.fix('.tabNavigation LI A');
				</script>
			<![endif]-->
  </head>
<body>

  <div id="admin-container">

    <div id="header">

      <div id="logo">
				<a href="${createLink(uri: '/')}">
					<img src="${resource(dir:'images', file:'mainicons/sigesti-01.png')}" alt="Your Logo" />
				</a>
      </div>
      <!-- END LOGO -->

    </div>
    <!-- END HEADER -->

    <!-- END NAVIGATION -->
		<g:if test="${flash.message}">
			<div class="message canhide">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${autenticacaoInstance}">
			<div class="errors canhide">
				<g:renderErrors bean="${autenticacaoInstance}" as="list" />
			</div>
		</g:hasErrors>
    <div id="admin-content">
      <g:form controller="autenticacao" action="login" method="post" onsubmit="\$('[placeholder]').placeholder('clear');">
        <g:textField id="email" name="email" placeholder="Email" /><br />
        <g:passwordField id="senha" name="senha" placeholder="Senha" />
        <p class="logar">
          <g:submitButton name="logar" id="logar" value="Logar" class="button" />
          <input type="reset" name="reset" id="reset" value="Limpar" class="button" />
        </p>
      </g:form>

    </div>
    <!-- END CONTEMT -->

  </div>
  <!-- END CONTAINER -->
</body>

</html>
