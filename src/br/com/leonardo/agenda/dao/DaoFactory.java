package br.com.leonardo.agenda.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import br.com.leonardo.agenda.HibernateSessionFactory;

public class DaoFactory {

	private final Session session;
	private Transaction transaction;

	public DaoFactory() {
		session = HibernateSessionFactory.getCurrentSession();
	}

	public void beginTransaction() {
		this.transaction = this.session.beginTransaction();
	}

	public Session getSession() {
		return session;
	}

	public void commit() {
		this.session.flush();
		this.transaction.commit();
		this.transaction = null;
	}

	public boolean hasTransaction() {
		return this.transaction != null && this.transaction.isActive();
	}

	public void rollback() {
		this.transaction.rollback();
		this.transaction = null;
	}

	public void close() {
		this.session.close();
	}

	public void flush() {
		this.session.flush();
	}

	/*
	public ClienteDao getClienteDao() {
		return new ClienteDao(this.session);
	}
	*/

	public UsuarioDao getUsuarioDao() {
		return new UsuarioDao(this.session);
	}


}
