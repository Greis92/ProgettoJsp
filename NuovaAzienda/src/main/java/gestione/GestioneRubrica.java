package gestione;

import java.util.List;

import bean.Rubrica;
import bean.Utente;
import bean.Voce;
import dao.RubricaDao;
import dao.UtenteDao;
import dao.VoceDao;

public class GestioneRubrica {

	RubricaDao rDao = new RubricaDao();
	VoceDao vDao = new VoceDao();
	UtenteDao uDao = new UtenteDao();
	
	GestioneUtente gUtente = new GestioneUtente();

	// RUBRICA

	// 1- CREA
	public Rubrica creaRubrica(long id) {
		Utente u = gUtente.readUserById(id);
		Rubrica r = new Rubrica(u.getNome());
		r.setUtente(u);
		rDao.creaRubrica(r);
		u.setRubrica(r);
		uDao.updateUser(u);
		rDao.updateRubrica(r);
		return r;

	}

	// 2- READ BY ID
	public Rubrica readRubricaById(long idR) {
		return rDao.readRubricaConId(idR);
	}

	// VOCE

	// 1- CREA
	public void insertVoce(long idU, Voce v) {
		Utente u = gUtente.readUserById(idU);
		Rubrica r = u.getRubrica();
		if (r == null) {
			r = creaRubrica(idU);
		}
		r.addVoce(v);
		v.setRubrica(r);
		vDao.insertVoce(v);
		vDao.updateVoce(v);
		rDao.updateRubrica(r);
	}

	// 2- DELETE
	public void deleteVoce(Voce v) {
		vDao.deleteVoce(v);
	}

	// 3- READ BY ID RETURN VOCE
	public Voce readVoceById(long idV) {
		return vDao.readVoceConId(idV);
	}

	// 3- READ BY ID RETURN BOOLEAN
	public boolean readVoceByIdBool(long idV) {
		Voce v = null;
		v = vDao.readVoceConId(idV);
		if (v != null) {
			return true;
		}
		return false;
	}

	// 4- GET VOCI DELLA RUBRICA PASSATA COME PARAMETRO
	public List<Voce> getAllVoci(Rubrica r) {
		return vDao.readAllVoci(r);
	}

	// 5- SET BEAN
	public void setBeanVoce(Voce v) {
		vDao.fillDatiVoce(v);
	}

	// 6- UPDATE
	public void updateVoce(Voce v) {
		vDao.updateVoce(v);
	}

}
