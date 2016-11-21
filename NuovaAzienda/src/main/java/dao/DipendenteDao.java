package dao;

import hibernateUtil.HibernateUtil;
import bean.Dipendente;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class DipendenteDao {

	// 1- CREATE
	public boolean insertDipendente(Dipendente d) {

		boolean res = false;

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			// INIZIO ELABORAZIONE DATI

			session.persist(d);

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

	// 2A- READ: READ ONE
	public Dipendente readDipendenteConId(Long id) {

		Dipendente d = null;

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			// INIZIO ELABORAZIONE DATI

			d = session.get(Dipendente.class, id);
			tx.commit(); // INSERISCE NEL DATABASE

		} catch (Exception e) {

			tx.rollback(); // SE LANCIA ECCEZIONE, CANCELLA TUTTA L'ELABORAZIONE
							// FATTA SOPRA

		} finally {

			session.close();

		}

		return d;

	}

	// 2B- READ: READ WITH USERNAME
	public Dipendente readDipendenteConUsername(String username) {

		Dipendente d = null;

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			// INIZIO ELABORAZIONE DATI

			Query query = session
					.createQuery("from Dipendente where username =:usernameInserito");
			query.setString("usernameInserito", username);

			d = (Dipendente) query.uniqueResult();

			tx.commit(); // INSERISCE NEL DATABASE

		} catch (Exception e) {

			tx.rollback(); // SE LANCIA ECCEZIONE, CANCELLA TUTTA L'ELABORAZIONE
							// FATTA SOPRA

		} finally {

			session.close();

		}

		return d;

	}

	// 2C- READ: READ ALL
	@SuppressWarnings("unchecked")
	public List<Dipendente> readAllDipendenti() {

		List<Dipendente> d = null;

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			// INIZIO ELABORAZIONE DATI

			Query query = session.createQuery("from Dipendente");

			d = (List<Dipendente>) query.list();

			tx.commit(); // INSERISCE NEL DATABASE

		} catch (Exception e) {

			tx.rollback(); // SE LANCIA ECCEZIONE, CANCELLA TUTTA L'ELABORAZIONE
							// FATTA SOPRA

		} finally {

			session.close();

		}

		return d;

	}

	// 3- UPDATE
	public boolean updateDipendente(Dipendente d) {

		boolean res = false;

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			// INIZIO ELABORAZIONE DATI

			session.update(d);
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
	public boolean deleteDipendente(Dipendente d) {

		boolean res = false;

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			// INIZIO ELABORAZIONE DATI

			session.delete(d);
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
	
	public void fillDatiDipendente(Dipendente d) {
		
		Dipendente dTemp = this.readDipendenteConId(d.getId_utente());
		
		d.setNome(dTemp.getNome());
		d.setCognome(dTemp.getCognome());
		d.setRuolo(dTemp.getRuolo());
		d.setUsername(dTemp.getUsername());
		d.setPassword(dTemp.getPassword());
		d.setPosizione(dTemp.getPosizione());
		d.setStipendio(dTemp.getStipendio());
		d.setRubrica(dTemp.getRubrica());
		
	}

}