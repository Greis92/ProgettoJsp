package gestione;

import dao.UtenteDao;
import bean.Utente;

public class GestioneUtente {

	UtenteDao uDao = new UtenteDao();
	
	GestionePass gPass = new GestionePass();

	// 1- REGISTRA
	public Utente registraUser(Utente ut) {
		Utente u = uDao.readUserConUsername(ut.getUsername());
		if (u == null) {
			u = ut;
			uDao.insertUser(u);
		}
		return u;
	}

	// 2- READ BY ID RETURN BOOLEAN
	public boolean readUserConId(long idUser) {
		boolean res = false;
		Utente ut = uDao.readUserConId(idUser);
		if (ut != null) {
			res = true;
		}
		return res;
	}

	// 2- READ BY ID RETURN UTENTE
	public Utente readUserById(long idUser) {
		return uDao.readUserConId(idUser);
	}

	// 3- ESISTE RETURN BOOLEAN
	public boolean existUserBoolean(String username, String password) {
		boolean res = false;
		Utente u = uDao.readUserConUsername(username);
		if (u != null && u.getPassword().equals(this.gPass.convertiPass(password))) {
			res = true;
		}
		return res;
	}

	// 3- ESISTE RETURN UTENTE
	public Utente existUser(String username) {
		return uDao.readUserConUsername(username);

	}

	// 4- SET BEAN
	public void setBeanUtente(Utente u) {
		uDao.fillDatiUtente(u);
	}

}
