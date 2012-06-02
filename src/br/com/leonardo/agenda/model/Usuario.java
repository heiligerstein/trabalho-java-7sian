package br.com.leonardo.agenda.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Usuario {

	@Id
	@GeneratedValue
	private int id;
	@Column(length=60)
	private String nome;
	@Column(length=60)
	private String email;
	@Temporal(TemporalType.DATE)
	private Date dataNascimento;
	@Column(length=200)
	private String perguntaSecreta;
	@Column(length=60)
	private String login;
	@Column(length=100)
	private String senha;
	@Column(length=200)
	private String foto;
	@Column(length=1)
	private String isConectado;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getDataNascimento() {
		return dataNascimento;
	}
	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}
	public String getPerguntaSecreta() {
		return perguntaSecreta;
	}
	public void setPerguntaSecreta(String perguntaSecreta) {
		this.perguntaSecreta = perguntaSecreta;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getIsConectado() {
		return isConectado;
	}
	public void setIsConectado(String isConectado) {
		this.isConectado = isConectado;
	}
	public String getFoto() {
		return foto;
	}
	public void setFoto(String foto) {
		this.foto = foto;
	}


}
