<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="br.com.leonardo.agenda.model.UsuarioModel"%>

<%
	String path = request.getParameter("path");
%>

<%
	if(session.getAttribute("ok") != null) {
%>
	<div style="margin-top:0" class="alert_success">
		<p>
			<img class="mid_align" alt="success" src="<%=request.getParameter("path")%>images/icon_accept.png">
				<%=session.getAttribute("ok")%>
		</p>
	</div>
<%
	session.removeAttribute("ok"); }
%>

<!-- erros encontrados no cadastro -->
<%
	if(session.getAttribute("erro") != null) {
%>
	<div style="margin-top:0" class="alert_warning">
		<p>
			<img class="mid_align" alt="success" src="<%=request.getParameter("path")%>images/icon_warning.png">
				<%=session.getAttribute("erro")%>
		</p>
	</div>
<%
	session.removeAttribute("erro"); }
%>

<!-- <h1>Usuários</h1>  -->

<!-- Begin one column window -->
<div class="onecolumn">
	<div class="header">
		<span style="cursor: n-resize;">Followers (Quem está me seguindo...)</span>
	</div>
	<br class="clear">
	<div class="content" style="display: block;">
		<table width="100%" cellspacing="0" cellpadding="0" class="data">
			<thead>
				<tr>
					<th style="width:10px">Id</th>
					<th style="width:35%">Nome</th>
					<th style="width:20%">Login</th>
					<th style="width:35%">Cidade</th>
					<th style="width:5%">Ações</th>
				</tr>
			</thead>
			<tbody>
				<%
					UsuarioModel usuario = (UsuarioModel) request.getAttribute("usuario");
				%>
				<%
					for (UsuarioModel us : usuario.getMeusSeguidores()) {
				%>
					<tr>
						<td><%= us.getId() %></td>
						<td><%= us.getNome() %></td>
						<td><a href=""><%= us.getLogin() %></a></td>
						<td><%= us.getCidade() %></td>
						<td>
							<a href="Usuario?op=nao_me_seguir&id_follower=<%= us.getId() %>"><img class="help" alt="deixar de seguir" src="<%= path %>images/icon_delete.png" original-title="Não me seguir"></a>							
						</td>
					</tr>
				<% } %>
			</tbody>
		</table>
		<div class="chart_wrapper" id="chart_wrapper"></div>
		<!-- End bar chart table-->

		<!-- Begin pagination
			<div class="pagination">
				<a href="#">«</a>
				<a class="active" href="#">1</a>
				<a href="#">2</a>
				<a href="#">3</a>
				<a href="#">4</a>
				<a href="#">5</a>
				<a href="#">6</a>
				<a href="#">»</a>
			</div>
		End pagination -->

	</div>
	
	<div style="position: relative; margin-bottom: 15px; margin-left: 15px;">
		<form method="GET" action="Usuario?op=list">
			<div class="submit">
				<input type="submit" value="Adicionar outros">
			</div>
		</form>
	</div>	
	
</div>
<!-- End one column window -->


