<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.com.leonardo.agenda.model.Usuario"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dados da Sessão: </title>
</head>
<body>

<%
	br.com.leonardo.agenda.model.Usuario newUsuario = (br.com.leonardo.agenda.model.Usuario) session.getAttribute("newUsuario");
%>

Dados da Sessão:

<table>
<tr>
<td><b>Foto</b></td><td><img src="<%= session.getAttribute("foto") %>"></td>
</tr>
<tr>
<td><b>Nome</b></td><td><%= newUsuario.getNome() %></td>
</tr>
<tr>
<td><b>E-mail</b></td><td><%= newUsuario.getEmail() %></td>
</tr>
<tr>
<td><b>Data de Nascimento</b></td><td><%= newUsuario.getDataNascimento() %></td>
</tr>
<tr>
<td><b>Sempre Conectado:</b></td><td><%= newUsuario.getIsConectado().length() > 1 ? "Sim" : "Não" %></td>
</tr>
<tr>
<td><b>Login</b></td><td><%= newUsuario.getLogin() %></td>
</tr>
<tr>
<td><b>Pergunta secreta:</b></td><td><%= newUsuario.getPerguntaSecreta() %></td>
</tr>
</table>

</body>
</html>