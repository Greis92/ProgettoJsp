package dao;

import hibernateUtil.HibernateUtil;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import bean.BustaPaga;
import bean.Dipendente;


public class BustaPagaDao {

	// 1- CREATE
	public boolean insertBustaPaga(BustaPaga bp) {

		boolean res = false;

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			// INIZIO ELABORAZIONE DATI

			session.persist(bp);

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
	public BustaPaga readBustaPagaConId(Long id) {

		BustaPaga bp = null;

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			// INIZIO ELABORAZIONE DATI

			bp = session.get(BustaPaga.class, id);
			tx.commit(); // INSERISCE NEL DATABASE

		} catch (Exception e) {

			tx.rollback(); // SE LANCIA ECCEZIONE, CANCELLA TUTTA L'ELABORAZIONE
							// FATTA SOPRA

		} finally {

			session.close();

		}

		return bp;

	}

	// 2B- READ: READ ALL
	@SuppressWarnings("unchecked")
	public List<BustaPaga> readAllBustaPaga() {

		List<BustaPaga> listaBuste = null;

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			// INIZIO ELABORAZIONE DATI

			Query query = session.createQuery("from BustaPaga");

			listaBuste = (List<BustaPaga>) query.list();

			tx.commit(); // INSERISCE NEL DATABASE

		} catch (Exception e) {

			tx.rollback(); // SE LANCIA ECCEZIONE, CANCELLA TUTTA L'ELABORAZIONE
							// FATTA SOPRA

		} finally {

			session.close();

		}

		return listaBuste;

	}
	
	// 2C- READ: READ WITH DATA AND DIPENDENTE
	public BustaPaga readAllBustaPaga(String data, Dipendente d) {
		BustaPaga bp = null;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session
					.createQuery("from BustaPaga where data=:dataInserita and dipendente=:dipendenteInserito");
			query.setString("dataInserita", data);
			query.setLong("dipendenteInserito", d.getId_utente());
			bp = (BustaPaga) query.uniqueResult();
			tx.commit();
		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}
		return bp;
	}
	
	// 2D- READ: READ WITH DIPENDENTE
	@SuppressWarnings("unchecked")
	public List<BustaPaga> readBustaPagaByDip(Dipendente d) {
		List<BustaPaga> listaBuste = null;
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session
					.createQuery("from BustaPaga where dip=:dipendenteInserito");
			query.setLong("dipendenteInserito", d.getId_utente());
			listaBuste = (List<BustaPaga>) query.list();
			tx.commit();
		} catch (Exception ex) {
			tx.rollback();
		} finally {
			session.close();
		}
		return listaBuste;
	}

	// 3- UPDATE
	public boolean updateBustaPaga(BustaPaga bp) {

		boolean res = false;

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			// INIZIO ELABORAZIONE DATI

			session.update(bp);
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
	public boolean deleteBustaPaga(BustaPaga bp) {

		boolean res = false;

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			// INIZIO ELABORAZIONE DATI

			session.delete(bp);
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
	
	public void fillDatiBustaPaga(BustaPaga bp) {
		
		BustaPaga bpTemp = this.readBustaPagaConId(bp.getIdBustaPaga());
		
		bp.setDip(bpTemp.getDip());
		bp.setDataEmissione(bpTemp.getDataEmissione());
		bp.setOreLavorate(bpTemp.getOreLavorate());
		bp.setImporto(bpTemp.getImporto());
		
	}

	

}
