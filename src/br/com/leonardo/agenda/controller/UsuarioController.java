package br.com.leonardo.agenda.controller;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.leonardo.agenda.dao.DaoFactory;
import br.com.leonardo.agenda.model.UsuarioModel;

public class UsuarioController extends Controller {
	
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public boolean processaRequisicao(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		this.request = request;
		this.response = response;

		// configurações padrões
		this.setaConfPadroes(request);
		
		if (request.getParameter("op") != null) {
			try {

				if (request.getParameter("op").equals("auth")) {
					auth();
					return true;
				}
				if (request.getParameter("op").equals("add")) { // create
					add();
					return true;
				}
				
				if (!isAuth()) {
					return false;
				}

				if (request.getParameter("op").equals("remove")) { // remove
					remove();
				}
				// if (request.getParameter("op").equals("show")) { // remove
					// show(rq, rp);
				// }
				if (request.getParameter("op").equals("edit")) {// update
					edit();
				}
				if (request.getParameter("op").equals("list")) { // list
					list();
				}
				if (request.getParameter("op").equals("seguir")) { // seguir alguem
					seguir();
				}
				if (request.getParameter("op").equals("nao_seguir")) { // deixar de seguir alguem
					naoSeguir();
				}
				if (request.getParameter("op").equals("nao_me_seguir")) { // deixar de seguir alguem
					naoMeSeguir();
				}
				if (request.getParameter("op").equals("following")) { // quem estou seguindo
					following();
				}
				if (request.getParameter("op").equals("followers")) { // quem estou seguindo
					followers();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			list();
		}
		return false;
	}
	
	private boolean seguir() throws Throwable {

		HttpSession session = request.getSession(true);
		int id_logado = (Integer) session.getAttribute("id");

		UsuarioModel usuarioParaSeguir = new DaoFactory().getUsuarioDao().procura(Integer.parseInt(request.getParameter("id_following")));
		UsuarioModel usuarioLogado = new DaoFactory().getUsuarioDao().procura(id_logado);
		
		try {
			// adiciona usuario a seguir			
			usuarioLogado.setSeguir(usuarioParaSeguir);
			new DaoFactory().getUsuarioDao().atualiza(usuarioLogado);
			setSuccessMessage("Ok, agora você está seguindo " + usuarioParaSeguir.getNome() + ".", "Usuario?op=list");
		} catch (Exception e) {
			setSessionError(e.getMessage(), "Usuario?op=list");
		}
		
		return false;
		
	}
	
	private boolean naoSeguir() throws Throwable {

		HttpSession session = request.getSession(true);
		UsuarioModel usuarioParaNaoSeguir = new DaoFactory().getUsuarioDao().procura(Integer.parseInt(request.getParameter("id_following")));
		UsuarioModel usuarioLogado = new DaoFactory().getUsuarioDao().procura((Integer) session.getAttribute("id"));
		
		try {
			// adiciona usuario a seguir			
			usuarioLogado.unsetSeguir(usuarioParaNaoSeguir);
			new DaoFactory().getUsuarioDao().atualiza(usuarioLogado);
			setSuccessMessage("Ok, agora você não segue mais " + usuarioParaNaoSeguir.getNome() + ".", "Usuario?op=following");
		} catch (Exception e) {
			setSessionError(e.getMessage(), "Usuario?op=following");
		}
		
		return false;
	}

	private boolean naoMeSeguir() throws Throwable {

		HttpSession session = request.getSession(true);
		UsuarioModel usuarioParaNaoMeSeguir = new DaoFactory().getUsuarioDao().procura(Integer.parseInt(request.getParameter("id_follower")));
		UsuarioModel usuarioLogado = new DaoFactory().getUsuarioDao().procura((Integer) session.getAttribute("id"));
		
		try {
			// remove usuario que não quero que me siga		
			usuarioParaNaoMeSeguir.unsetSeguir(usuarioLogado);
			new DaoFactory().getUsuarioDao().atualiza(usuarioParaNaoMeSeguir);
			setSuccessMessage("Ok, agora você não é mais seguido por " + usuarioParaNaoMeSeguir.getNome() + ".", "Usuario?op=followers");
		} catch (Exception e) {
			setSessionError(e.getMessage(), "Usuario?op=following");
		}
		
		return false;
	}
	
	private boolean serSeguido() {
		return false;
	}

	private boolean isAuth() throws IOException, ServletException {
		HttpSession session = request.getSession(true);
		if(session.getAttribute("nome") == null){
			session.invalidate();
			response.sendRedirect("Usuario?op=auth");
			return false;
		}
		return true;
	}

	private boolean auth() throws ServletException, IOException {

		if(request.getParameter("logout") != null) {
			HttpSession session = request.getSession(true);
			session.removeAttribute("nome");
		}

		String login = null;
		String senha = null;

		// acesso normal à pagina de login
		if(request.getParameter("login") != null && request.getParameter("senha") != null) {
			login = request.getParameter("login");
			senha = md5(request.getParameter("senha"));

		// atributos não passados / primeiro acesso
		} else {
			request.getRequestDispatcher("/themes/weadmin/login.jsp?page=usuarios&action=auth&path=/Agenda/themes/weadmin/").forward(request, response);
			return false;
		}

		// checagem do usuário
		UsuarioModel usuario = new DaoFactory().getUsuarioDao().search(login, senha);

		// não logou
		try {
			if(usuario.getLogin() == null)
				request.getRequestDispatcher("/themes/weadmin/login.jsp?page=usuarios&action=auth&path=/Agenda/themes/weadmin/").forward(request, response);

			// logou
			else {
				HttpSession session = request.getSession(true);
				session.setAttribute("nome", usuario.getLogin());
				session.setAttribute("id", usuario.getId());
				session.setAttribute("usuario", usuario);
				response.sendRedirect("Usuario?op=list");
			}

		// não logou
		} catch(Exception e) {
			response.sendRedirect("Usuario?op=auth");
		}
		return true;
	}

	// Função para criar hash da senha informada
	private static String md5(String senha){
		String sen = "";
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		BigInteger hash = new BigInteger(1, md.digest(senha.getBytes()));
		sen = hash.toString(100);
		return sen;
	}

	@SuppressWarnings("unused")
	public void list() throws ServletException, IOException {

		List<UsuarioModel> usuarios;

		// listagem com filtro
		if(request.getParameter("keyword") != null) {
			usuarios = new DaoFactory().getUsuarioDao(). procuraCampos(request.getParameter("search_by").toString(), request.getParameter("keyword").toString());
		} else {
			usuarios = new DaoFactory().getUsuarioDao().listaTudo();
		}

		request.setAttribute("usuarios", usuarios);
		request.getRequestDispatcher("/themes/weadmin/index.jsp?page=usuarios&action=list&path=/Agenda/themes/weadmin/").forward(request, response);

	}
	
	private void following() throws ServletException, IOException {

		HttpSession session = request.getSession(true);
		UsuarioModel usuario = new DaoFactory().getUsuarioDao().procura((Integer) session.getAttribute("id"));
		
		request.setAttribute("usuario", usuario);
		request.getRequestDispatcher("/themes/weadmin/index.jsp?page=usuarios&action=following&path=/Agenda/themes/weadmin/").forward(request, response);

	}
	
	private void followers() throws ServletException, IOException {

		HttpSession session = request.getSession(true);
		UsuarioModel usuario = new DaoFactory().getUsuarioDao().procura((Integer) session.getAttribute("id"));
		
		request.setAttribute("usuario", usuario);
		request.getRequestDispatcher("/themes/weadmin/index.jsp?page=usuarios&action=followers&path=/Agenda/themes/weadmin/").forward(request, response);

	}

	private void setSessionError(String e, String redirect) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		session.setAttribute("erro", e);
		response.sendRedirect(redirect);
	}

	private void setSuccessMessage(String e, String redirect) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		session.setAttribute("ok", e);
		response.sendRedirect(redirect);
	}

	@SuppressWarnings("unused")
	private void add() throws ServletException, IOException {

		/* Caso não haja dados, vai para a janela de inserção*/
		if(request.getParameter("nome") == null) {
			request.getRequestDispatcher("/themes/weadmin/index.jsp?page=usuarios&action=add&path=/Agenda/themes/weadmin/").forward(request, response);

		/* Caso haja dados, insere-os */
		} else {

			UsuarioModel newUsuario = new UsuarioModel();
			newUsuario.setNome(request.getParameter("nome"));
			newUsuario.setNomePai(request.getParameter("nomePai"));
			newUsuario.setNomeMae(request.getParameter("nomeMae"));
			newUsuario.setIdentidade(request.getParameter("identidade"));
			newUsuario.setCpf(request.getParameter("cpf"));
			if(request.getParameter("dataNascimento") != null) {
				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy"); // cria formatador
				try {
					Date dataNascimento = formatter.parse(request.getParameter("dataNascimento")); // formata data do parâmetro para o formato de data do java
					newUsuario.setDataNascimento(dataNascimento);
				} catch (Exception e) {
					e.printStackTrace();
					setSessionError("Data em formato ou período inválido", "/themes/weadmin/index.jsp?page=usuarios&action=add&path=/Agenda/themes/weadmin/");
				}
			}
			newUsuario.setLogradouro(request.getParameter("logradouro"));
			newUsuario.setCidade(request.getParameter("cidade"));
			newUsuario.setEstado(request.getParameter("estado"));
			newUsuario.setLogin(request.getParameter("login"));
			newUsuario.setEmail(request.getParameter("email"));

			if(request.getParameter("senha") != null)
				newUsuario.setSenha(md5(request.getParameter("senha")));

			/* adiciona os dados ao banco e redireciona para a list*/
			try {
				new DaoFactory().getUsuarioDao().adiciona(newUsuario);
				setSuccessMessage("Usuário cadastrado com sucesso.", "Usuario?op=list");
			} catch (Exception e) {
				setSessionError("Erro ao cadastrar usuário", "/themes/weadmin/index.jsp?page=usuarios&action=add&path=/Agenda/themes/weadmin/");
			}
		}

 	}

	@SuppressWarnings("unused")
	private void remove() {

		try {
			new DaoFactory().getUsuarioDao().excluirRegistro(Integer.parseInt(request.getParameter("id")));
			setSuccessMessage("Usuário excluído com sucesso.", "Usuario?op=list");
		} catch(Exception e) {
			try {
				setSessionError("Erro ao excluir usuário.", "/themes/weadmin/index.jsp?page=usuarios&action=edit&path=/Agenda/themes/weadmin/");
			} catch (ServletException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}
	
	@SuppressWarnings("unused")
	private boolean edit() throws ServletException, IOException {
		
		UsuarioModel usuario = new DaoFactory().getUsuarioDao().procura(Integer.parseInt(request.getParameter("id")));
		
		// permite ao usuário logado mudar apenas os seus próprios dados
		HttpSession session = request.getSession(true);
		if(Integer.parseInt(request.getParameter("id")) != (Integer) session.getAttribute("id")) {
			setSessionError("Você não possui permissão para editar dados de outro usuário.", "Usuario?op=list");
			return false;
		}
		
		/* Caso não haja dados, vai para a janela de inserção*/
		if(request.getParameter("nome") == null) {
			request.setAttribute("usuario", usuario);
			request.getRequestDispatcher("/themes/weadmin/index.jsp?page=usuarios&action=edit&path=/Agenda/themes/weadmin/").forward(request, response);

		/* Caso haja dados, insere-os */
		} else {
			UsuarioModel newUsuario = new DaoFactory().getUsuarioDao().procura(Integer.parseInt(request.getParameter("id")));
			newUsuario.setNome(request.getParameter("nome"));
			newUsuario.setNomePai(request.getParameter("nomePai"));
			newUsuario.setNomeMae(request.getParameter("nomeMae"));
			newUsuario.setIdentidade(request.getParameter("identidade"));
			newUsuario.setCpf(request.getParameter("cpf"));
			if(request.getParameter("dataNascimento") != null) {
				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy"); // cria formatador
				try {
					Date dataNascimento = formatter.parse(request.getParameter("dataNascimento")); // formata data do parâmetro para o formato de data do java
					newUsuario.setDataNascimento(dataNascimento);
				} catch (Exception e) {
					// e.printStackTrace();
					setSessionError("Data em formato ou período inválido.", "/themes/weadmin/index.jsp?page=usuarios&action=edit&path=/Agenda/themes/weadmin/");
					return false;
				}
			}
			newUsuario.setLogradouro(request.getParameter("logradouro"));
			newUsuario.setCidade(request.getParameter("cidade"));
			newUsuario.setEstado(request.getParameter("estado"));
			newUsuario.setEmail(request.getParameter("email"));
			
			/*
			if(request.getParameter("login").equals("")) {
				setSessionError("O campo login é obrigatório.", "/themes/weadmin/index.jsp?page=usuarios&action=edit&path=/Agenda/themes/weadmin/");
				return false;
			} else {
				newUsuario.setLogin(request.getParameter("login"));
			}
			*/

			if(!request.getParameter("senha").equals(""))
				newUsuario.setSenha(md5(request.getParameter("senha")));

			/* adiciona os dados ao banco e redireciona para a list*/
			try {
				new DaoFactory().getUsuarioDao().atualiza(newUsuario);
				setSuccessMessage("Usuário atualizado com sucesso.", "Usuario?op=list");
				// response.sendRedirect("Usuario?op=list");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
 	}
	
}
