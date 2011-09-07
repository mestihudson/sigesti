<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sample title</title>
</head>
<body>
	<div class="body">
		<h1>Login</h1>
		<g:if test="${flash.message}">
			<div class="message">
				${flash.message}
			</div>
		</g:if>
		<g:form action="authenticate" method="post">
			<div class="dialog">
				<table>
					<tbody>
						<tr class="prop">
							<td class="nome"><label for="email">Email:</label></td>
							<td><input type="text" id="email" name="email" /></td>
						</tr>

						<tr class="prop">
							<td class="nome"><label for="password">Password:</label></td>
							<td><input type="password" id="senha" name="senha" /></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="buttons">
				<span class="button"> <input class="save" type="submit"
					value="Logar" /> </span>
			</div>
		</g:form>
	</div>
</body>
</html>
