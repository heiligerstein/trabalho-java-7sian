package br.com.leonardo.agenda.dao;

import org.hibernate.Session;
import br.com.leonardo.agenda.model.Usuario;

public class UsuarioDao extends Dao<Usuario> {

	@SuppressWarnings("unused")
	private Session session;

	UsuarioDao(Session session) {
		super(session, Usuario.class);
		this.session = session;
	}

}
