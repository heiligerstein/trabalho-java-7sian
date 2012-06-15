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
		<span style="cursor: n-resize;">Lista de Usuários</span>
	</div>
	<br class="clear">
	<div class="content" style="display: block;">
		<form accept-charset="utf-8" action="Usuario?op=list" method="post">
			<input type="text" size="30" name="keyword">
			<select name="search_by">
				<option value="nome">Nome</option>
				<option value="login">Login</option>
				<option value="cidade">Cidade</option>
			</select>
			<input type="submit" style="position: relative; top: -1px; margin: 5px 10px 10px 5pt; font-size:10px;" value="Buscar">
		</form>
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
					List<UsuarioModel> usuarios = (List<UsuarioModel>) request.getAttribute("usuarios");
				%>
				<%
					for (UsuarioModel usuario : usuarios) {
				%>
					<tr>
						<td><%= usuario.getId() %></td>
						<td><%= usuario.getNome() %></td>
						<td><a href=""><%= usuario.getLogin() %></a></td>
						<td><%= usuario.getCidade() %></td>
						<td>
							<!-- 
							<a href="Usuario?op=edit&id=<%= usuario.getId() %>"><img class="help" alt="edit" src="<%= path %>images/icon_edit.png" original-title="Editar"></a>
							<a href="Usuario?op=remove&id=<%= usuario.getId() %>"><img class="help" alt="delete" src="<%= path %>images/icon_delete.png" original-title="Deletar"></a>
							 -->
							<a href="Usuario?op=seguir&id_following=<%= usuario.getId() %>"><img class="help" alt="seguir" src="<%= path %>images/user_go.png" original-title="Seguir"></a>
							<a href="Usuario?op=ser_seguido&id_follower=<%= usuario.getId() %>"><img class="help" alt="seguir" src="<%= path %>images/user_go.png" original-title="Ser Seguido"></a>
							<%
								//for(UsuarioModel eu_sigo : usuario.getaQuemEuSigo()) {
									// out.println("Eu: " + (Integer) session.getAttribute("id"));
									// out.println("Sigo: " + eu_sigo.getId());
								//	if(eu_sigo.getId() == usuario.getId()) {
							%>
									<!-- 
									<a href="Usuario?op=nao_seguir&id_following=<%= usuario.getId() %>"><img class="help" alt="seguir" src="<%= path %>images/icon_add_follower.png" original-title="Deixar de seguir"></a>
									 -->	
							<%
									//}
								//}
							%>
						</td>
					</tr>
				<% } %>
			</tbody>
		</table>
		<div class="chart_wrapper" id="chart_wrapper"></div>
		<!-- End bar chart table-->

	</div>
</div>
<!-- End one column window -->