<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- Begin one column window -->
<div class="onecolumn">
	<div class="header">
		<span>Usuários</span>
	</div>
<br class="clear">
<div class="content">
<!-- começo do header da caixa -->

<!--
| id             | int(11)     | NO   | PRI | NULL    | auto_increment |
| nome           | varchar(60) | YES  |     | NULL    |                |
| nomeMae        | varchar(60) | YES  |     | NULL    |                |
| nomePai        | varchar(60) | YES  |     | NULL    |                |
| identidade     | varchar(60) | YES  |     | NULL    |                |
| cpf            | varchar(60) | YES  |     | NULL    |                |
| dataNascimento | date        | YES  |     | NULL    |                |
| logradouro     | varchar(30) | YES  |     | NULL    |                |
| cidade         | varchar(30) | YES  |     | NULL    |                |
| estado         | varchar(2)  | YES  |     | NULL    |                |
| login          | varchar(60) | YES  |     | NULL    |                |
| senha          | varchar(60) | YES  |     | NULL    |                |
 -->

<form accept-charset="utf-8" action="Usuario?op=add" method="post">
	<input type="hidden" value="POST" name="">
	<div>
		<div class="input text">
			<label>Nome Completo <br></label>
			<input type="text" maxlength="60" size="70" name="nome">
		</div><br>
	</div>
	<div>
		<div class="input text">
			<label>Nome da Mãe <br></label>
			<input type="text" maxlength="60" size="70" name="nomeMae">
		</div><br>
	</div>
	<div>
		<div class="input text">
			<label>Nome do Pai <br></label>
			<input type="text" maxlength="60" size="70" name="nomePai">
		</div><br>
	</div>
	<div>
		<div class="input text">
			<label>Identidade <br></label>
			<input type="text" id="numeric" maxlength="30" size="30" name="identidade">
		</div><br>
	</div>
	<div>
		<div class="input text">
			<label>CPF <br></label>
			<input type="text" id="cpf" maxlength="25" size="30" name="cpf">
		</div><br>
	</div>
	<div>
		<div class="input text">
			<label>Data de Nascimento <br></label>
			<input type="text" id="datepicker" maxlength="15" size="15" name="dataNascimento">
		</div><br>
	</div>
	<div>
		<div class="input text">
			<label>Logradouro <br></label>
			<input type="text" maxlength="30" size="50" name="logradouro">
		</div><br>
	</div>
	<div>
		<div class="input text">
			<label>Cidade <br></label>
			<input type="text" maxlength="30" size="30" name="cidade">
		</div><br>
	</div>
	<div>
		<div class="input text">
			<label>Estado <br></label>
		    <select name="estado">
			    <option value="AC">AC</option>
			    <option value="AL">AL</option>
			    <option value="AM">AM</option>
			    <option value="AP">AP</option>
			    <option value="BA">BA</option>
			    <option value="CE">CE</option>
			    <option value="DF">DF</option>
			    <option value="ES">ES</option>
			    <option value="GO">GO</option>
			    <option value="MA">MA</option>
			    <option value="MG">MG</option>
			    <option value="MS">MS</option>
			    <option value="MT">MT</option>
			    <option value="PA">PA</option>
			    <option value="PB">PB</option>
			    <option value="PE">PE</option>
			    <option value="PI">PI</option>
			    <option value="PR">PR</option>
			    <option value="RJ">RJ</option>
			    <option value="RN">RN</option>
			    <option value="RO">RO</option>
			    <option value="RR">RR</option>
			    <option value="RS">RS</option>
			    <option value="SC">SC</option>
			    <option value="SE">SE</option>
			    <option value="SP">SP</option>
			    <option value="TO">TO</option>
		    </select>
		</div><br>
	</div>
	<div>
		<div class="input text">
			<label>Login <br></label>
			<input type="text" maxlength="30" size="30" name="login">
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