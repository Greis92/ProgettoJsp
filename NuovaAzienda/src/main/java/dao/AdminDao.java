package dao;

import hibernateUtil.HibernateUtil;
import bean.Admin;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class AdminDao {

	// 1- CREATE
	public boolean insertAdmin(Admin a) {

		boolean res = false;

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			// INIZIO ELABORAZIONE DATI

			session.persist(a);

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
	public Admin readAdminConId(Long id) {

		Admin a = null;

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			// INIZIO ELABORAZIONE DATI

			a = session.get(Admin.class, id);
			tx.commit(); // INSERISCE NEL DATABASE

		} catch (Exception e) {

			tx.rollback(); // SE LANCIA ECCEZIONE, CANCELLA TUTTA L'ELABORAZIONE
							// FATTA SOPRA

		} finally {

			session.close();

		}

		return a;

	}

	// 2B- READ: READ WITH USERNAME
	public Admin readAdminConUsername(String username) {

		Admin a = null;

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			// INIZIO ELABORAZIONE DATI

			Query query = session
					.createQuery("from Admin where username =:usernameInserito");
			query.setString("usernameInserito", username);

			a = (Admin) query.uniqueResult();

			tx.commit(); // INSERISCE NEL DATABASE

		} catch (Exception e) {

			tx.rollback(); // SE LANCIA ECCEZIONE, CANCELLA TUTTA L'ELABORAZIONE
							// FATTA SOPRA

		} finally {

			session.close();

		}

		return a;

	}

	// 2C- READ: READ ALL
	@SuppressWarnings("unchecked")
	public List<Admin> readAllAdmin() {

		List<Admin> a = null;

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			// INIZIO ELABORAZIONE DATI

			Query query = session.createQuery("from Admin");

			a = (List<Admin>) query.list();

			tx.commit(); // INSERISCE NEL DATABASE

		} catch (Exception e) {

			tx.rollback(); // SE LANCIA ECCEZIONE, CANCELLA TUTTA L'ELABORAZIONE
							// FATTA SOPRA

		} finally {

			session.close();

		}

		return a;

	}

	// 3- UPDATE
	public boolean updateAdmin(Admin a) {

		boolean res = false;

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			// INIZIO ELABORAZIONE DATI

			session.update(a);
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
	public boolean deleteAdmin(Admin a) {

		boolean res = false;

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			// INIZIO ELABORAZIONE DATI

			session.delete(a);
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

	public void fillDatiAdmin(Admin a) {
		
		Admin aTemp = this.readAdminConId(a.getId_utente());
		
		a.setNome(aTemp.getNome());
		a.setCognome(aTemp.getCognome());
		a.setRuolo(aTemp.getRuolo());
		a.setUsername(aTemp.getUsername());
		a.setPassword(aTemp.getPassword());
		a.setLivelloAccesso(aTemp.getLivelloAccesso());
		
	}

}
