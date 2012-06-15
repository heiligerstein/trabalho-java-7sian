package br.com.leonardo.agenda.model;

import java.util.*;
import javax.persistence.*;

@Entity
public class UsuarioModel {

	@Id
	@GeneratedValue
	private int id;
	@Column(length=60)
	private String nome;
	@Column(length=60)
	private String nomePai;
	@Column(length=60)
	private String nomeMae;
	@Column(length=60)
	private String identidade;
	@Column(length=60)
	private String cpf;
	@Temporal(TemporalType.DATE)
	private Date dataNascimento;
	@Column(length=30)
	private String logradouro;
	@Column(length=30)
	private String cidade;
	@Column(length=2)
	private String estado;
	@Column(length=60)
	private String login;
	@Column(length=60)
	private String senha;
	@Column(length=60)
	private String email;
	@Column(length=200)
	private String foto;
	
	public UsuarioModel() {}
	
	@ManyToMany
	@JoinTable(
		name="usuario_seguidores",
		joinColumns={@JoinColumn(name="id", referencedColumnName="id")},
		inverseJoinColumns={@JoinColumn(name="id_seguidor", referencedColumnName="id")}
	)
	private Set<UsuarioModel> meusSeguidores;
	
	@ManyToMany
	@JoinTable(name="usuario_seguidores",
		joinColumns={@JoinColumn(name="id_seguidor", referencedColumnName="id")},
		inverseJoinColumns={@JoinColumn(name="id", referencedColumnName="id")}
	)
	private Set<UsuarioModel> aQuemEuSigo;
	
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getIdentidade() {
		return identidade;
	}
	public void setIdentidade(String identidade) {
		this.identidade = identidade;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getLogradouro() {
		return logradouro;
	}
	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getNomeMae() {
		return nomeMae;
	}
	public void setNomeMae(String nomeMae) {
		this.nomeMae = nomeMae;
	}
	public String getNomePai() {
		return nomePai;
	}
	public void setNomePai(String nomePai) {
		this.nomePai = nomePai;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public Date getDataNascimento() {
		return dataNascimento;
	}
	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFoto() {
		return foto;
	}
	public void setFoto(String foto) {
		this.foto = foto;
	}

	
	// seguidores e quem sigo
	public Set<UsuarioModel> getMeusSeguidores() {
		if(meusSeguidores == null)
			return Collections.emptySet();
		return meusSeguidores;
	}
	
	public Set<UsuarioModel> getaQuemEuSigo() {
		if(aQuemEuSigo == null)
			return Collections.emptySet();
		return aQuemEuSigo;
	}
	
	public void setSeguir(UsuarioModel usuario) throws Throwable {
		if(aQuemEuSigo == null) 
			aQuemEuSigo = new HashSet<UsuarioModel>();

		// adiciona somente se não for ele mesmo
		if(this.getId() != usuario.getId())
			aQuemEuSigo.add(usuario);
		else
			throw new Exception("Você não pode seguir a você mesmo. Seria uma contradição!");
	}
	
	public void setSerSeguido(UsuarioModel usuario) throws Throwable {
		if(meusSeguidores == null) 
			meusSeguidores = new HashSet<UsuarioModel>();

		// adiciona somente se não for ele mesmo
		if(this.getId() != usuario.getId())
			meusSeguidores.add(usuario);
		else
			throw new Exception("Você não pode ser seguido por você mesmo. Seria uma contradição!");
	}
	
	public void unsetSeguir(UsuarioModel usuario) throws Throwable {

		if(aQuemEuSigo == null) 
			aQuemEuSigo = new HashSet<UsuarioModel>();

		// remove caso ele exista na lista
		if(aQuemEuSigo.contains(usuario))
			aQuemEuSigo.remove(usuario);
		else
			throw new Exception("Você não pode remover alguém que não segue. Estranho, não!?");
	}
	

	/*
	public void setMeusSeguidores(Set<UsuarioModel> meusSeguidores) {
		this.meusSeguidores = meusSeguidores;
	}
	*/
	
	/*
	public void setaQuemEuSigo(Set<UsuarioModel> aQuemEuSigo) {
		this.aQuemEuSigo = aQuemEuSigo;
	}
	*/

}
