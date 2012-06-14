package br.com.leonardo.agenda.dao;

import org.hibernate.Session;
import br.com.leonardo.agenda.model.UsuarioModel;

public class UsuarioDao extends Dao<UsuarioModel> {

	@SuppressWarnings("unused")
	private Session session;

	UsuarioDao(Session session) {
		super(session, UsuarioModel.class);
		this.session = session;
	}

}
