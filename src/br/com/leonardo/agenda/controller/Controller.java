package br.com.leonardo.agenda.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

public class Controller {
	
	public HttpServletRequest request;
	
	
	// seta as configurações padrões a todos os controllers
	public void setaConfPadroes(HttpServletRequest request) throws UnsupportedEncodingException {
		this.request = request;
		this.request.setCharacterEncoding("UTF-8"); // resolve o problema do charset
	}
	
}
