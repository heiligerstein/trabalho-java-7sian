package br.com.leonardo.agenda.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import br.com.leonardo.agenda.HibernateSessionFactory;

public class Dao<T> {

	public final Session session;
	private final Class classe;

	Dao(Session session, Class classe) {
		this.session = session;
		this.classe = classe;
	}
	protected Session getSession() {
		return session;
	}
	@SuppressWarnings("unchecked")
	public Integer  adicionaPegaNumero(T u) {
		session.beginTransaction();
		int cod = (Integer) this.session.save(u);
		session.beginTransaction().commit();
		return cod;
	}

	public void  adiciona(T u) {
		 HibernateSessionFactory.doBeginTransaction();
		 HibernateSessionFactory.getCurrentSession().save(u);
		 HibernateSessionFactory.doCommit();
	}
	public void AdicionaOuAtualiza(T u) {
		HibernateSessionFactory.doBeginTransaction();
		this.session.saveOrUpdate( u);
		HibernateSessionFactory.doCommit();
	}

	@SuppressWarnings("unchecked")
	public void excluirRegistro(Object  id) {
		T u =  (T) session.get(this.classe, Integer.parseInt(id.toString()));
		HibernateSessionFactory.doBeginTransaction();
		session.delete(u);
		session.flush();
		HibernateSessionFactory.doCommit();
	}

	@SuppressWarnings("unchecked")
	public T pegarUltimo(){
		Criteria criteria = session.createCriteria( this.classe );
		criteria.addOrder( Order.desc( "id" ) );
		return ( T ) criteria.uniqueResult();
	}
	@SuppressWarnings("unchecked")
	public T procura(int   id) {
		return (T) session.get(this.classe, id);
	}

	public void atualiza(T u) {
		HibernateSessionFactory.doBeginTransaction();
		session.update(u);
		HibernateSessionFactory.doCommit();
	}


	@SuppressWarnings("unchecked")
	public List<T> listaTudo() {
		List<T> list = new ArrayList<T>();
		list = this.session.createCriteria(this.classe).addOrder( Order.asc("id") ).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<T> listaTudoOrderBy(String Campo) {
		return this.session.createCriteria(this.classe).addOrder( Order.asc(Campo) ).list();
	}

	@SuppressWarnings("unchecked")
	public T search(String login, String senha) {
		return (T) session.createCriteria(this.classe).add(
				Restrictions.eq("login", login)).add(Restrictions.eq("senha", senha)).uniqueResult();
	}

	@SuppressWarnings("unchecked")
	public List<T> procuraCampos(String campo, String valor) {
		String hql = " FROM "+ this.classe.getSimpleName() +" WHERE "+campo+" LIKE '%" + valor+ "%'";
	    Query query = session.createQuery(hql);
	    return query.list();
	}

	@SuppressWarnings("unchecked")
	public List<T> listaAniversariantes(Date dia) {
		 String DiaInicio,MesInicio,DiaTermino,MesTermino;
			DiaInicio = new SimpleDateFormat("dd").format(dia.getTime());					DiaTermino = new SimpleDateFormat("dd").format(dia.getTime());					MesInicio = new SimpleDateFormat("MM").format(dia.getTime());					MesTermino = new SimpleDateFormat("MM").format(dia.getTime());					String SQL = "Select * FROM "+ this.classe.getSimpleName() +" Where (Extract(Month From DtaNascimento) + (Extract(Day From DtaNascimento) / 100.00)) between ("+MesInicio+" + ("+DiaInicio+" / 100.00)) and ("+MesTermino+" + ("+DiaTermino+" / 100.0))";
			return this.session.createSQLQuery(SQL).addEntity(this.classe).list();

	}

}
