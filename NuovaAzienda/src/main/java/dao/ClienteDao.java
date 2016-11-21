package dao;

import hibernateUtil.HibernateUtil;
import bean.Cliente;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class ClienteDao {
	
	//1- CREATE
	public boolean insertClient(Cliente c){
		
		boolean res = false;
		
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
		
		try{
			tx = session.getTransaction();
			tx.begin();
			
			// INIZIO ELABORAZIONE DATI
			
			session.persist(c);
			
			tx.commit(); //INSERISCE NEL DATABASE
			res = true;
		
		}catch(Exception e){ 
			
			tx.rollback(); // SE LANCIA ECCEZIONE, CANCELLA TUTTA L'ELABORAZIONE FATTA SOPRA
			
		}finally{
			
			session.close();
			
		}
		
		return res;
		
	}
	

	//2A- READ: READ ONE
	public Cliente readClientConId(Long id) {

		Cliente c = null;
		
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
			
		try{
			tx = session.getTransaction();
			tx.begin();
				
			// INIZIO ELABORAZIONE DATI
				
			c = session.get(Cliente.class,id);
			tx.commit(); //INSERISCE NEL DATABASE
				
			
		}catch(Exception e){ 
				
			tx.rollback(); // SE LANCIA ECCEZIONE, CANCELLA TUTTA L'ELABORAZIONE FATTA SOPRA
				
		}finally{
				
			session.close();
				
		}
			
			return c;
			
	}
	

	//2B- READ: READ WITH USERNAME
	public Cliente readClientConUsername(String username) {

		Cliente c = null;
		
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
			
		try{
			tx = session.getTransaction();
			tx.begin();
				
			// INIZIO ELABORAZIONE DATI
		
			Query query = session.createQuery("from Cliente where username =:usernameInserito");
			query.setString("usernameInserito",username);
			
			c = (Cliente) query.uniqueResult();
			
			tx.commit(); //INSERISCE NEL DATABASE
				
			
		}catch(Exception e){ 
				
			tx.rollback(); // SE LANCIA ECCEZIONE, CANCELLA TUTTA L'ELABORAZIONE FATTA SOPRA
				
		}finally{
				
			session.close();
				
		}
			
			return c;
			
	}
	

	//2C- READ: READ ALL 
	@SuppressWarnings("unchecked")
	public List<Cliente> readAllClient() {
			
		List<Cliente> c = null;
				
		Session session = HibernateUtil.openSession();
		Transaction tx = null;
					
		try{
			tx = session.getTransaction();
			tx.begin();
						
			// INIZIO ELABORAZIONE DATI
				
			Query query = session.createQuery("from Cliente");
					
			 c = (List<Cliente>) query.list();
					
			tx.commit(); //INSERISCE NEL DATABASE
						
					
		}catch(Exception e){ 
						
			tx.rollback(); // SE LANCIA ECCEZIONE, CANCELLA TUTTA L'ELABORAZIONE FATTA SOPRA
						
		}finally{
						
			session.close();
						
		}
					
		return c;
					
	}
		

	//3- UPDATE
	public boolean updateClient(Cliente c) {

		boolean res = false;

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			// INIZIO ELABORAZIONE DATI

			session.update(c);
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
	

	//4- DELETE 
	public boolean deleteClient(Cliente c) {

		boolean res = false;

		Session session = HibernateUtil.openSession();
		Transaction tx = null;

		try {
			tx = session.getTransaction();
			tx.begin();

			// INIZIO ELABORAZIONE DATI

			session.delete(c);
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


	public void fillDatiClient(Cliente c) {
		
		Cliente cTemp = this.readClientConId(c.getId_utente());
		
		c.setNome(cTemp.getNome());
		c.setCognome(cTemp.getCognome());
		c.setRuolo(cTemp.getRuolo());
		c.setUsername(cTemp.getUsername());
		c.setPassword(cTemp.getPassword());
		c.setPartitaIva(cTemp.getPartitaIva());
		c.setRagioneSociale(cTemp.getRagioneSociale());
		c.setRubrica(cTemp.getRubrica());
			
	}
		

}
