package dao;

import java.util.List;

import hibernateUtil.HibernateUtil;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import bean.Rubrica;
import bean.Voce;

public class VoceDao {

	// 1- CREATE
	public boolean insertVoce(Voce v) {
		
		boolean res = false;
		
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		
		try{
			tx = session.getTransaction();
			tx.begin();
			
			// INIZIO ELABORAZIONE DATI
			
			session.persist(v);
			
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
	public Voce readVoceConId(long id) {

		Voce v = null;
		
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
			
		try{
			tx = session.getTransaction();
			tx.begin();
				
			// INIZIO ELABORAZIONE DATI
				
			session.get(Voce.class, id);
			tx.commit(); //INSERISCE NEL DATABASE
				
			
		}catch(Exception e){ 
				
			tx.rollback(); // SE LANCIA ECCEZIONE, CANCELLA TUTTA L'ELABORAZIONE FATTA SOPRA
				
		}finally{
				
			session.close();
				
		}
			
			return v;
			
	}
		
	// 2B- READ: READ WITH NAME AND SURNAME
	public Voce readAllVoce(Rubrica r,String n,String c) {

		Voce v = null;
			
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
			
		try{
			tx = session.getTransaction();
			tx.begin();
				
			// INIZIO ELABORAZIONE DATI
				
			Query query = session
					.createQuery("from Voce where nome =: nomeInserito"
					+ "and cognome =: cognomeInserito"
					+ "where id_rubrica =: idR");
			
			query.setString("nomeInserito", n);
			query.setString("cognomeInserito", c);
			query.setLong("idR", r.getId_rubrica());
			
			v = (Voce) query.uniqueResult();
				
			tx.commit(); //INSERISCE NEL DATABASE
					
		}catch(Exception e){ 
				
			tx.rollback(); // SE LANCIA ECCEZIONE, CANCELLA TUTTA L'ELABORAZIONE FATTA SOPRA
				
		}finally{
				
			session.close();
				
		}
			
		return v;
			
	}
	
	// 2C- READ: READ WITH NAME, SURNAME AND NUMBER
	public Voce readAllVoce(Rubrica r, String n, String c, String tel) {

		Voce v = null;

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			// INIZIO ELABORAZIONE DATI

			Query query = session
					.createQuery("from Voce where nome =: nomeInserito"
							+ "and cognome =: cognomeInserito and telefono =: telefonoInserito"
							+ "where id_rubrica =: idR");

			query.setString("nomeInserito", n);
			query.setString("cognomeInserito", c);
			query.setString("telefonoInserito", tel);
			query.setLong("idR", r.getId_rubrica());

			v = (Voce) query.uniqueResult();

			tx.commit(); // INSERISCE NEL DATABASE

		} catch (Exception e) {

			tx.rollback(); // SE LANCIA ECCEZIONE, CANCELLA TUTTA L'ELABORAZIONE
							// FATTA SOPRA

		} finally {

			session.close();

		}

		return v;
				
	}
	
	// 2D- READ: READ ALL
	@SuppressWarnings("unchecked")
	public List<Voce> readAllVoci(Rubrica r) {

		List<Voce> listaVoci = null;

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			// INIZIO ELABORAZIONE DATI

			Query query = session.createQuery("from Voce where rubrica =:rubricaInserita");
			
			query.setLong("rubricaInserita", r.getId_rubrica());
			
			listaVoci = (List<Voce>) query.list();
			
			tx.commit(); // INSERISCE NEL DATABASE

		} catch (Exception e) {

			tx.rollback(); // SE LANCIA ECCEZIONE, CANCELLA TUTTA L'ELABORAZIONE
							// FATTA SOPRA

		} finally {

			session.close();

		}

		return listaVoci;
				
	}
	
	// 3- UPDATE
	public boolean updateVoce(Voce v) {

		boolean res = false;

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			// INIZIO ELABORAZIONE DATI

			session.update(v);
			tx.commit(); // INSERISCE NEL DATABASE
			res = true;

		} catch (Exception e) {

			tx.rollback(); // SE LANCIA ECCEZIONE, CANCELLA TUTTA L'ELABORAZIONE
							// FATTA SOPRA

		} finally {

			session.close();

		}

		return res;
	}

	// 4- DELETE
	public boolean deleteVoce(Voce v) {

		boolean res = false;

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			// INIZIO ELABORAZIONE DATI

			session.delete(v);
			tx.commit(); // INSERISCE NEL DATABASE
			res = true;

		} catch (Exception e) {

			tx.rollback(); // SE LANCIA ECCEZIONE, CANCELLA TUTTA L'ELABORAZIONE
							// FATTA SOPRA

		} finally {

			session.close();

		}

		return res;
	}

}
