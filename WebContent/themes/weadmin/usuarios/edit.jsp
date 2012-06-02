<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.com.leonardo.agenda.model.Usuario" %>
<%@page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- erros encontrados no cadastro -->
<% if(session.getAttribute("erro") != null) { %>
	<div style="margin-top:0" class="alert_warning">
		<p>
			<img class="mid_align" alt="success" src="<%= request.getParameter("path") %>images/icon_warning.png">
				<%= session.getAttribute("erro") %>
		</p>
	</div>
<% session.removeAttribute("erro"); } %>

<!-- carrega o usuário a ser editado -->
<% 	Usuario usuario = (Usuario) request.getAttribute("usuario"); %>

<!-- Begin one column window -->

<div class="onecolumn">
	<div class="header">
		<span>Usuários</span>
	</div>
<br class="clear">
<div class="content">
<!-- começo do header da caixa -->

<form accept-charset="utf-8" action="Usuario?op=edit" method="post">
	<input type="hidden" name="id" value="<%= usuario.getId() %>">
	<div>
		<div class="input text">
			<label>Nome Completo <br></label>
			<input type="text" maxlength="60" size="70" name="nome" value="<%= usuario.getNome() != null ? usuario.getNome() : "" %>">
		</div><br>
	</div>
	<div>
		<div class="input text">
			<label>Nome da Mãe <br></label>
			<input type="text" maxlength="60" size="70" name="nomeMae" value="<%= usuario.getNomeMae() != null ? usuario.getNomeMae() : "" %>">
		</div><br>
	</div>
	<div>
		<div class="input text">
			<label>Nome do Pai <br></label>
			<input type="text" maxlength="60" size="70" name="nomePai" value="<%= usuario.getNomePai() != null ? usuario.getNomePai() : "" %>">
		</div><br>
	</div>
	<div>
		<div class="input text">
			<label>Identidade <br></label>
			<input type="text" id="numeric" maxlength="30" size="30" name="identidade" value="<%= usuario.getIdentidade() != null ? usuario.getIdentidade() : "" %>">
		</div><br>
	</div>
	<div>
		<div class="input text">
			<label>CPF <br></label>
			<input type="text" id="cpf" maxlength="25" size="30" name="cpf" value="<%= usuario.getCpf() != null ? usuario.getCpf() : "" %>">
		</div><br>
	</div>
	<div>
		<div class="input text">
			<label>Data de Nascimento <br></label>
			<%
				String dataNascimento = "";
				if(usuario.getDataNascimento() != null) {
					SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");
					dataNascimento = formatador.format(usuario.getDataNascimento());
				}
			%>
			<input type="text" id="datepicker" maxlength="15" size="15" name="dataNascimento" value="<%= dataNascimento != null ? dataNascimento : "" %>">
		</div><br>
	</div>
	<div>
		<div class="input text">
			<label>Logradouro <br></label>
			<input type="text" maxlength="30" size="50" name="logradouro" value="<%= usuario.getLogradouro() != null ? usuario.getLogradouro() : "" %>">
		</div><br>
	</div>
	<div>
		<div class="input text">
			<label>Cidade <br></label>
			<input type="text" maxlength="30" size="30" name="cidade" value="<%= usuario.getCidade() != null ? usuario.getCidade() : "" %>">
		</div><br>
	</div>
	<div>
		<div class="input text">
			<label>Estado <br></label>
		    <select name="estado">
		    	<%
			    	String uf = usuario.getEstado();
		    		uf = uf == null ? "" : uf;
		    	%>
			    <option value="AC" <%= uf.equals("AC") ? "selected=\"selected\"" : "" %>>AC</option>
			    <option value="AL" <%= uf.equals("AL") ? "selected=\"selected\"" : "" %>>AL</option>
			    <option value="AM" <%= uf.equals("AM") ? "selected=\"selected\"" : "" %>>AM</option>
			    <option value="AP" <%= uf.equals("AP") ? "selected=\"selected\"" : "" %>>AP</option>
			    <option value="BA" <%= uf.equals("BA") ? "selected=\"selected\"" : "" %>>BA</option>
			    <option value="CE" <%= uf.equals("CE") ? "selected=\"selected\"" : "" %>>CE</option>
			    <option value="DF" <%= uf.equals("DF") ? "selected=\"selected\"" : "" %>>DF</option>
			    <option value="ES" <%= uf.equals("ES") ? "selected=\"selected\"" : "" %>>ES</option>
			    <option value="GO" <%= uf.equals("GO") ? "selected=\"selected\"" : "" %>>GO</option>
			    <option value="MA" <%= uf.equals("MA") ? "selected=\"selected\"" : "" %>>MA</option>
			    <option value="MG" <%= uf.equals("MG") ? "selected=\"selected\"" : "" %>>MG</option>
			    <option value="MS" <%= uf.equals("MS") ? "selected=\"selected\"" : "" %>>MS</option>
			    <option value="MT" <%= uf.equals("MT") ? "selected=\"selected\"" : "" %>>MT</option>
			    <option value="PA" <%= uf.equals("PA") ? "selected=\"selected\"" : "" %>>PA</option>
			    <option value="PB" <%= uf.equals("PB") ? "selected=\"selected\"" : "" %>>PB</option>
			    <option value="PE" <%= uf.equals("PE") ? "selected=\"selected\"" : "" %>>PE</option>
			    <option value="PI" <%= uf.equals("PI") ? "selected=\"selected\"" : "" %>>PI</option>
			    <option value="PR" <%= uf.equals("PR") ? "selected=\"selected\"" : "" %>>PR</option>
			    <option value="RJ" <%= uf.equals("RJ") ? "selected=\"selected\"" : "" %>>RJ</option>
			    <option value="RN" <%= uf.equals("RN") ? "selected=\"selected\"" : "" %>>RN</option>
			    <option value="RO" <%= uf.equals("RO") ? "selected=\"selected\"" : "" %>>RO</option>
			    <option value="RR" <%= uf.equals("RR") ? "selected=\"selected\"" : "" %>>RR</option>
			    <option value="RS" <%= uf.equals("RS") ? "selected=\"selected\"" : "" %>>RS</option>
			    <option value="SC" <%= uf.equals("SC") ? "selected=\"selected\"" : "" %>>SC</option>
			    <option value="SE" <%= uf.equals("SE") ? "selected=\"selected\"" : "" %>>SE</option>
			    <option value="SP" <%= uf.equals("SP") ? "selected=\"selected\"" : "" %>>SP</option>
			    <option value="TO" <%= uf.equals("TO") ? "selected=\"selected\"" : "" %>>TO</option>

		    </select>
		</div><br>
	</div>
	<div>
		<div class="input text">
			<label>Login <br></label>
			<input type="text" maxlength="30" size="30" name="login" value="<%= usuario.getLogin() != null ? usuario.getLogin() : "" %>">
		</div><br>
	</div>
	<div>
		<div class="input text">
			<label>Senha <br></label>
			<input type="password" maxlength="30" size="30" name="senha">
		</div><br>
	</div>


<div id="linha_tracejada"></div>

<div class="submit"><input type="submit" value="Salvar"></div></form>
<!-- footer de caixa -->
	</div>
</div>
<!-- End one column window -->