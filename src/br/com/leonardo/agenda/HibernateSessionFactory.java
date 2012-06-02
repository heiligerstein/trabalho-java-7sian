package br.com.leonardo.agenda;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import br.com.leonardo.agenda.model.*;

public class HibernateSessionFactory {

	private static String host = "localhost";
	private static String porta = "3306";
	private static String bd = "agenda";
	private static String usuario = "root";
	private static String senha = "leogddku";

	protected HibernateSessionFactory() {
		super();
	}

	/* Threads que controlarão a sessão e a transação */
	private static final ThreadLocal<Session> threadSession = new ThreadLocal<Session>();
	private static final ThreadLocal<Transaction> threadTransaction = new ThreadLocal<Transaction>();

	/* Variaveis do Hibernate */
    private static SessionFactory sessionFactory;

    /**
     * M�todo que retorna a instancia da Sess�o.
     * @return Session
     * @throws SessionFactoryException
     */
    public static Session getCurrentSession()  {
        Session session = threadSession.get();

		try {
			if (session == null || !session.isOpen()) {
				if (sessionFactory == null) {
				    	try {
				    		String url = "jdbc:mysql://"+ host +":"+porta+"/"+bd+ "?autoReconnect=true";
				    		AnnotationConfiguration cfg  = new AnnotationConfiguration();

				    		// cfg.addAnnotatedClass(Cliente.class);
				    		cfg.addAnnotatedClass(Usuario.class);

				    		cfg.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQLInnoDBDialect")
				            .setProperty("hibernate.connection.driver_class", "com.mysql.jdbc.Driver")
				            .setProperty("hibernate.connection.url", url)
				            .setProperty("hibernate.connection.username", usuario)
				            .setProperty("hibernate.connection.password", senha)
				            .setProperty("hibernate.show_sql", "true")
				            .setProperty("hibernate.format_sql", "true")
				    		.setProperty("hibernate.generate_statistics", "true")
				            .setProperty("hibernate.use_sql_comments", "true")
				    		.setProperty("hibernate.hbm2ddl.auto", "update");

				    		sessionFactory = cfg.buildSessionFactory();

					} catch (HibernateException e) {
						sessionFactory = null;
						throw e;
					}
				}
				session = (sessionFactory != null) ? sessionFactory.openSession() : null;
				threadSession.set(session);
			}
		} catch (Exception e) {
			session = null;
			throw new HibernateException(e);
		}

        return session;
    }


    public static void doCloseSession() throws HibernateException {
        Session session = threadSession.get();
        threadSession.set(null);

        try {
			if (session != null) {
			    session.close();
			}
		} catch (Exception e) {
			throw new HibernateException(e);
		}
    }

    /**
     * M�todo que inicia a transa��o do Hibernate.
     * @throws SessionFactoryException
     */
    public static void doBeginTransaction() throws HibernateException {
    	Transaction tx = threadTransaction.get();

    	try {
			if(tx == null){
				tx = getCurrentSession().beginTransaction();
				threadTransaction.set(tx);
			}
		} catch (Exception e) {
			throw new HibernateException(e);
		}
    }

    /**
     * M�todo que executa o rollback da transa��o.
     * @throws SessionFactoryException
     */
    public static void doRollback() throws HibernateException {
    	Transaction tx = threadTransaction.get();

    	try {
			if(tx != null && !tx.wasCommitted() && !tx.wasRolledBack()){
				tx.rollback();
				threadTransaction.set(null);
			}
		} catch (Exception e) {
			throw new HibernateException(e);
		}
    }

    /**
     * M�todo que commita a transa��o.
     * @throws SessionFactoryException
     */
    public static void doCommit() throws HibernateException {
    	Transaction tx = threadTransaction.get();

    	try {
			if(tx != null && !tx.wasCommitted() && !tx.wasRolledBack()){
				tx.commit();
				threadTransaction.set(null);
			}
		} catch (Exception e) {
			doRollback();
			throw new HibernateException(e);
		}
    }

	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public static void setSessionFactory(SessionFactory sessionFactory) {
		HibernateSessionFactory.sessionFactory = sessionFactory;
	}


}