package br.com.leonardo.agenda.servlet;

import java.util.regex.*;
import java.io.File;
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

import org.apache.commons.fileupload.*;
import org.apache.commons.io.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;

import br.com.leonardo.agenda.dao.DaoFactory;

import com.tombrus.javaParser.Token.Iterator;

public class Usuario extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	
	private String path = "/TwitterUnibrasil/themes/twitter/"; 

	public Usuario() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doIt(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doIt(request, response);
	}

	protected boolean doIt(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8"); // resolve o problema do charset

		if(request.getParameter("op") != null){
			try {

				/*
				if(request.getParameter("op").equals("auth")) {
					auth(request, response);
					return true;
				}
				*/

				if(request.getParameter("op").equals("add")) { // create
					add(request, response);
				}
				
				if(request.getParameter("op").equals("show")) { // create
					request.getRequestDispatcher("themes/twitter/show.jsp").forward(request, response);
				}
				

				// autentica acoes que necessitam de autenticacao
				/*
				if(!isAuth(request, response)) {
					return false;
				}
				*/

				if(request.getParameter("op").equals("remove")) {// remove
					remove(request, response);
				}

				if(request.getParameter("op").equals("show")) { // remove
					//show(request, response);
				}

				if(request.getParameter("op").equals("edit")) {// update
					edit(request, response);
				}

				if(request.getParameter("op").equals("list")) { // list
					list(request, response);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			list(request, response);
		}

		return false;

	}

	@SuppressWarnings("rawtypes")
	private int add(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		br.com.leonardo.agenda.model.Usuario newUsuario = new br.com.leonardo.agenda.model.Usuario();
		
		// Check that we have a file upload request
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);

		if (isMultipart) {
			
		    // Create a factory for disk-based file items
		    FileItemFactory factory = new DiskFileItemFactory();

		    // Create a new file upload handler
		    ServletFileUpload upload = new ServletFileUpload(factory);

		    // Parse the request
		    List /* FileItem */ items = upload.parseRequest(request);
		    
		    // Process the uploaded items
		    java.util.Iterator iter = items.iterator();
		    while (((java.util.Iterator) iter).hasNext()) {

		    	FileItem item = (FileItem) ((java.util.Iterator) iter).next();

		        if (item.isFormField()) {
		            
		        	// Process form field.
		        	String name = item.getFieldName();
		            String value = item.getString();
		            
		            if(name.equals("nome")) {
		            	if(value.isEmpty()) {
							setSessionError(request, response, "O campo 'Nome' não pode estar vazio.", "themes/twitter/signup.jsp?page=usuarios&action=add&path=" + path);
							return 0;
		            	}
		            	newUsuario.setNome(value);
		            }
		            if(name.equals("email")) {
						Pattern p = Pattern.compile("^[\\w-]+(\\.[\\w-]+)*@([\\w-]+\\.)+[a-zA-Z]{2,7}$");
						Matcher m = p.matcher(value);
						if (!m.find()) {
							setSessionError(request, response, "O 'e-mail' enviado é inválido.", "themes/twitter/signup.jsp?page=usuarios&action=add&path=" + path);
							return 0;
						} else {
							newUsuario.setEmail(value);
						}
		            }
		            if(name.equals("login"))
		            	newUsuario.setLogin(value);
		            if(name.equals("senha"))
		            	newUsuario.setSenha(value);
		            if(name.equals("pergunta_secreta"))
		            	newUsuario.setPerguntaSecreta(value);
		            if(name.equals("mantenha_conectado"))
		            	newUsuario.setIsConectado(value);
		            if(name.equals("data_nascimento")) {
						if(value != null) {
							SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy"); // cria formatador
							try {
								Date dataNascimento = formatter.parse(value); // formata data do parâmetro para o formato de data do java
								newUsuario.setDataNascimento(dataNascimento);
							} catch (Exception e) {
								setSessionError(request, response, "'Data de nascimento' em formato ou período inválido", "themes/twitter/signup.jsp?page=usuarios&action=add&path=" + path);
								return 0;
							}
						}
		            }
		            
		            if(name.equals("senha"))
		            	if(value != null)
		            		newUsuario.setSenha(md5(value));
		            
		        } else {
		            
		        	// Process uploaded file.
		            String fieldName = item.getFieldName();
		            String fileName = item.getName();
		            String contentType = item.getContentType();
		            boolean isInMemory = item.isInMemory();
		            long sizeInBytes = item.getSize();
		            
		            if(sizeInBytes > 0) {
			            newUsuario.setFoto("/tmp/" + fileName);
		            	File uploadedFile = new File("/tmp/" + fileName);
		            	item.write(uploadedFile);
		            }
		            
		        }
		    }
		    
			/* adiciona os dados ao banco e redireciona para a list*/
			try {
				new DaoFactory().getUsuarioDao().adiciona(newUsuario);
				HttpSession session = request.getSession(true);
				session.setAttribute("newUsuario", newUsuario);
				setSuccessMessage(request, response, "Usuário cadastrado com sucesso.", "Usuario?op=add");
			} catch (Exception e) {
				e.printStackTrace();
				setSessionError(request, response, "Erro ao cadastrar usuário", "/themes/twitter/signup.jsp?page=usuarios&action=add&path=" + path);
			}
			
		}
		
		if (!response.isCommitted())
			request.getRequestDispatcher("themes/twitter/signup.jsp?page=usuarios&action=add&path=" + path).forward(request, response);
		return 0;
			
 	}
	
	private boolean isAuth(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession(true);
		if(session.getAttribute("nome") == null){
			session.invalidate();
			response.sendRedirect("Usuario?op=auth");
			return false;
		}
		return true;
	}

	private boolean auth(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
			request.getRequestDispatcher("/themes/twitter/login.jsp?page=usuarios&action=auth&path=" + path).forward(request, response);
			return false;
		}

		// checagem do usuário
		br.com.leonardo.agenda.model.Usuario usuario = new DaoFactory().getUsuarioDao().search(login, senha);

		// não logou
		try {
			if(usuario.getLogin() == null)
				request.getRequestDispatcher("/themes/twitter/login.jsp?page=usuarios&action=auth&path=" + path).forward(request, response);

			// logou
			else {
				HttpSession session = request.getSession(true);
				session.setAttribute("nome", usuario.getLogin());
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
	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<br.com.leonardo.agenda.model.Usuario> usuarios;

		// listagem com filtro
		if(request.getParameter("keyword") != null)
			usuarios = new DaoFactory().getUsuarioDao(). procuraCampos(request.getParameter("search_by").toString(), request.getParameter("keyword").toString());
		else
			usuarios = new DaoFactory().getUsuarioDao().listaTudo();

		request.setAttribute("usuarios", usuarios);
		request.getRequestDispatcher("/themes/twitter/index.jsp?page=usuarios&action=list&path=" + path).forward(request, response);

	}

	private void setSessionError(HttpServletRequest request, HttpServletResponse response, String e, String redirect) throws ServletException, IOException {

		// br.com.leonardo.agenda.model.Usuario usuario = new DaoFactory().getUsuarioDao().procura(Integer.parseInt(request.getParameter("id")));

		try {
			br.com.leonardo.agenda.model.Usuario usuario = new DaoFactory().getUsuarioDao().procura(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("usuario", usuario);
		}catch (Exception e1){
			
		}
		
		HttpSession session = request.getSession(true);
		session.setAttribute("erro", e);

		// if(request.getParameter("nome") == null)
		// request.setAttribute("usuario", usuario);

		request.getRequestDispatcher(redirect).forward(request, response);
		
	}

	private void setSuccessMessage(HttpServletRequest request, HttpServletResponse response, String e, String redirect) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		session.setAttribute("ok", e);
		if(redirect.equals(null))
			response.sendRedirect("Usuario?op=list");
		else
			response.sendRedirect(redirect);
	}

	@SuppressWarnings("unused")
	private void remove(HttpServletRequest request, HttpServletResponse response) {

		try {
			new DaoFactory().getUsuarioDao().excluirRegistro(Integer.parseInt(request.getParameter("id")));
			setSuccessMessage(request, response, "Usuário excluído com sucesso.", "Usuario?op=list");
		} catch(Exception e) {
			try {
				setSessionError(request, response, "Erro ao excluir usuário.", "/themes/twitter/index.jsp?page=usuarios&action=edit&path=" + path);
			} catch (ServletException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}

	@SuppressWarnings("unused")
	private boolean edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		br.com.leonardo.agenda.model.Usuario usuario = new DaoFactory().getUsuarioDao().procura(Integer.parseInt(request.getParameter("id")));

		/* Caso não haja dados, vai para a janela de inserção*/
		if(request.getParameter("nome") == null) {
			request.setAttribute("usuario", usuario);
			request.getRequestDispatcher("/themes/twitter/index.jsp?page=usuarios&action=edit&path=" + path).forward(request, response);

		/* Caso haja dados, insere-os */
		} else {
			br.com.leonardo.agenda.model.Usuario newUsuario = new DaoFactory().getUsuarioDao().procura(Integer.parseInt(request.getParameter("id")));
			newUsuario.setNome(request.getParameter("nome"));
			if(request.getParameter("dataNascimento") != null) {
				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy"); // cria formatador
				try {
					Date dataNascimento = formatter.parse(request.getParameter("dataNascimento")); // formata data do parâmetro para o formato de data do java
					newUsuario.setDataNascimento(dataNascimento);
				} catch (Exception e) {
					// e.printStackTrace();
					setSessionError(request, response, "Data em formato ou período inválido.", "/themes/twitter/index.jsp?page=usuarios&action=edit&path=" + path);
					return false;
				}
			}

			// newUsuario.setEstado(request.getParameter("estado"));

			if(request.getParameter("login").equals("")) {
				setSessionError(request, response, "O campo login é obrigatório.", "/themes/twitter/index.jsp?page=usuarios&action=edit&path=" + path);
				return false;
			} else {
				newUsuario.setLogin(request.getParameter("login"));
			}

			if(!request.getParameter("senha").equals(""))
				newUsuario.setSenha(md5(request.getParameter("senha")));

			/* adiciona os dados ao banco e redireciona para a list*/
			try {
				new DaoFactory().getUsuarioDao().atualiza(newUsuario);
				setSuccessMessage(request, response, "Usuário atualizado com sucesso.", "Usuario?op=list");
				// response.sendRedirect("Usuario?op=list");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;

 	}

}