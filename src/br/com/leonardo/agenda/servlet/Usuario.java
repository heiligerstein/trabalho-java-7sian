package br.com.leonardo.agenda.servlet;

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

import br.com.leonardo.agenda.controller.UsuarioController;
import br.com.leonardo.agenda.dao.DaoFactory;

public class Usuario extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {

	private UsuarioController usuarioController = new UsuarioController();
	
	public Usuario() {
		super();
	}

	protected void doGet(HttpServletRequest rq, HttpServletResponse rp) throws ServletException, IOException {
		try {
			doIt(rq, rp);
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest rq, HttpServletResponse rp) throws ServletException, IOException {
		try {
			doIt(rq, rp);
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}

	protected boolean doIt(HttpServletRequest rq, HttpServletResponse rp) throws Throwable {
		return usuarioController.processaRequisicao(rq, rp);
		// return false;
	}

}