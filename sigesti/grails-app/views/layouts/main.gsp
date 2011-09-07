<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <title>
      SIGESTI - Sistema de Gerenciamento de Suporte em Tecnologia da Informação
    </title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<link rel="shortcut icon" href="${resource(dir:'images',file:'mainicons/chamado.png')}" type="image/x-icon" />

		<!-- principal biblioteca - jQuery -->
		<g:javascript library="jquery" plugin="jquery" />
		<g:javascript src="jquery-ui-1.8.13.custom.min.js" />
		<g:layoutHead />

		<!-- Import jQuery UI Javascript & Customer Scripts file  -->
		<g:javascript src="ui_scripts.js" />

		<!-- LOAD WYSIWYG EDITOR -->
		<g:javascript src="jquery.wysiwyg.js" />

		<!-- LOAD TABLESORTER -->
		<g:javascript src="jquery.tablesorter.min.js" />

		<!-- LOAD CUFON FOR FONT REPLACEMENT -->
		<g:javascript src="cufon/cufon-yui.js" />
		<g:javascript src="cufon/Qlassik_Font.js" />

		<g:javascript>
				Cufon.replace('H1');
		</g:javascript>

		<g:javascript>
			$(function() {
				$("#sortable").sortable();
				$("#sortable").disableSelection();
			});
		</g:javascript>

		<!-- Import Master CSS File  -->
		<link href="${resource(dir:'css', file:'styles.css')}" rel="stylesheet" type="text/css" />

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

		<div id="container">
			<div id="header">
				<div id="logo">
					<a href="${createLink(uri: '/')}">
						<img src="${resource(dir:'images', file:'mainicons/sigesti-01.png')}" alt="Your Logo" />
					</a>
				</div>
				<!-- END LOGO -->

				<div id="panel">
					<p>
						<g:if test="${session.usuario}">
							<b>Olá, ${session?.usuario?.nome}!</b><g:link controller="autenticacao" action="logout">Sair</g:link>
						</g:if>
						<g:else>
							<b>Usuário não autenticado.</b><g:link controller="autenticacao" action="index">Login</g:link>
						</g:else>
					</p>
				</div>
				<!-- END PANEL -->

			</div>
			<!-- END HEADER -->

			<div id="content">

				<div class="secondary_content">

					<div class="sidebar">
					<h1 class="h1">Menu Sigesti</h1>
					<ul>
						<g:if test="${session?.usuario}">
							<g:render template="/layouts/menu" />
						</g:if>
						<g:else>
							<li><img src="${resource(dir:'images', file:'mainicons/semsessao.png')}" alt="Settings" class="png_bg" />
								<g:link controller="chamado" action="list">Chamado</g:link><br />
								<p>Chamado</p>
							</li>
						</g:else>
					</ul>

					</div>
					<!-- END SIDEBAR -->


				</div>
				<!-- END SECONDARY CONTEMT -->


				<div id="main_content">

					<g:layoutBody />

				</div>
				<!-- END MAIN CONTENT -->

			</div>
			<!-- END CONTEMT -->

		</div>
		<!-- END CONTAINER -->

		<div id="footer">
			<p>
				© Copyright 2011 SIGESTI | <a href="#">Ir para o topo</a>
			</p>
		</div>
		<script type="text/javascript"> Cufon.now();</script>

	</body>
</html>