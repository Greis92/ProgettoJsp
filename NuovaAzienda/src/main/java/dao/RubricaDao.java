package dao;

import java.util.List;

import hibernateUtil.HibernateUtil;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import bean.Rubrica;
import bean.Voce;


public class RubricaDao {
	
	// 1- CREATE
	public boolean creaRubrica(Rubrica r){
		
		boolean res = false;
		
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		
		try{
			tx = session.getTransaction();
			tx.begin();
			
			// INIZIO ELABORAZIONE DATI
			
			session.persist(r);
			
			tx.commit(); //INSERISCE NEL DATABASE
			res = true;
		
		}catch(Exception e){ 
			
			tx.rollback(); // SE LANCIA ECCEZIONE, CANCELLA TUTTA L'ELABORAZIONE FATTA SOPRA
			
		}finally{
			
			session.close();
			
		}
		
		return res;
		
	}
	
	
	// 2A- READ: READ ONE
	public Rubrica readRubricaConId(long id) {

		Rubrica r = null;
		
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		
		try{
			tx = session.getTransaction();
			tx.begin();
			
			// INIZIO ELABORAZIONE DATI
			
			r = session.get(Rubrica.class,id);
			tx.commit(); //INSERISCE NEL DATABASE
			
		
		}catch(Exception e){ 
			
			tx.rollback(); // SE LANCIA ECCEZIONE, CANCELLA TUTTA L'ELABORAZIONE FATTA SOPRA
			
		}finally{
			
			session.close();
			
		}
		
		return r;
		
	}
	
	// 2B- READ: READ WITH NAME
	public Rubrica readRubricaConNome(String n) {

		Rubrica r = null;
		
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		
		try{
			tx = session.getTransaction();
			tx.begin();
			
			// INIZIO ELABORAZIONE DATI
			
			Query query = session
					.createQuery("from Rubrica where nome =: nomeInserito");
			query.setString("nomeInserito", n);
			
			r = (Rubrica) query.uniqueResult();
			
			tx.commit(); //INSERISCE NEL DATABASE
			
		
		}catch(Exception e){ 
			
			tx.rollback(); // SE LANCIA ECCEZIONE, CANCELLA TUTTA L'ELABORAZIONE FATTA SOPRA
			
		}finally{
			
			session.close();
			
		}
		
		return r;
		
	}
	
	// 2C- READ: READ ALL
		@SuppressWarnings("unchecked")
		public List<Voce> readAllRubrica(long id) {

			List<Voce> v = null;

			Session session = HibernateUtil.openSession();
			Transaction tx = null;

			try {
				tx = session.getTransaction();
				tx.begin();

				// INIZIO ELABORAZIONE DATI

				Query query = session
						.createQuery("from Rubrica where id_rubrica =: idInserito");
				
				query.setLong("idInserito", id);
				
				v = (List<Voce>) query.list();

				tx.commit(); // INSERISCE NEL DATABASE

			} catch (Exception e) {

				tx.rollback(); // SE LANCIA ECCEZIONE, CANCELLA TUTTA L'ELABORAZIONE
								// FATTA SOPRA

			} finally {

				session.close();

			}

			return v;

		}

	
	// 3- UPDATE
	public boolean updateRubrica(Rubrica r){
		
		boolean res = false;
		
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		
		try{
			tx = session.getTransaction();
			tx.begin();
			
			// INIZIO ELABORAZIONE DATI
			
			session.update(r);
			tx.commit(); //INSERISCE NEL DATABASE
			res = true;
		
		}catch(Exception e){ 
			
			tx.rollback(); // SE LANCIA ECCEZIONE, CANCELLA TUTTA L'ELABORAZIONE FATTA SOPRA
			
		}finally{
			
			session.close();
			
		}
		
		return res;
	}
	
	// 4- DELETE
	public boolean deleteRubrica(Rubrica r){
		
		boolean res = false;
		
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		
		try{
			tx = session.getTransaction();
			tx.begin();
			
			// INIZIO ELABORAZIONE DATI
			
			session.delete(r);
			tx.commit(); //INSERISCE NEL DATABASE
			res = true;
		
		}catch(Exception e){ 
			
			tx.rollback(); // SE LANCIA ECCEZIONE, CANCELLA TUTTA L'ELABORAZIONE FATTA SOPRA
			
		}finally{
			
			session.close();
			
		}
		
		return res;
	}

	
}
