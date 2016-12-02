package gestione;

import java.util.List;

import dao.DipendenteDao;
import bean.Dipendente;

public class GestioneDipendente {

	DipendenteDao dDao = new DipendenteDao();

	// 1- REGISTRA
	public Dipendente registraDipendente(Dipendente dp) {
		Dipendente d = dDao.readDipendenteConUsername(dp.getUsername());
		if (d == null) {
			d = dp;
			dDao.insertDipendente(d);
		}
		return d;
	}

	// 2- READ BY ID RETURN BOOLEAN
	public boolean readDipendenteConId(long idDip) {
		boolean res = false;
		Dipendente d = dDao.readDipendenteConId(idDip);
		if (d != null) {
			res = true;
		}
		return res;
	}

	// 2- READ BY ID RETURN DIPENDENTE
	public Dipendente readDipendente(long idDip) {
		return dDao.readDipendenteConId(idDip);
	}

	// 3- DELETE
	public void deleteDipendente(Dipendente d) {
		dDao.deleteDipendente(d);
	}

	// 4- UPDATE
	public void updateDipendente(Dipendente d) {
		dDao.updateDipendente(d);
	}

	// 5- ESISTE RETURN BOOLEAN
	public boolean existDipendente(String username) {
		boolean res = false;
		Dipendente d = dDao.readDipendenteConUsername(username);
		if (d != null) {
			res = true;
		}
		return res;
	}

	// 6- SET BEAN
	public void setBeanDipendente(Dipendente d) {
		dDao.fillDatiDipendente(d);
	}

	// 7- LISTA DIPENDENTI
	public List<Dipendente> readAllDipendenti() {
		return dDao.readAllDipendenti();
	}

}
