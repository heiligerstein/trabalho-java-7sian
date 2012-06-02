package br.com.leonardo.agenda;

import java.util.Iterator;
import java.util.List;

import br.com.leonardo.agenda.dao.DaoFactory;
import br.com.leonardo.agenda.model.Usuario;

public class TesteInsereUsuario {

	public static void main(String[] args) {

		Usuario newUsuario = new Usuario();
		newUsuario.setNome("Teste");
		// newUsuario.setIdade(33);

		/**
		 * Ex 1
		 */
		// HibernateSessionFactory.doBeginTransaction();
		// HibernateSessionFactory.getCurrentSession().save(newUsuario);
		// HibernateSessionFactory.doCommit();

		/**
		 * Ex 2
		 */
		new DaoFactory().getUsuarioDao().adiciona(newUsuario);

		/**
		 * Ex 3
		 */

		/*
		List<Usuario> usuarios = new DaoFactory().getUsuarioDao().listaTudo();
		for (Usuario usuario : usuarios) {
			System.out.println(usuario.getNome());
		}
		*/

	}

}
