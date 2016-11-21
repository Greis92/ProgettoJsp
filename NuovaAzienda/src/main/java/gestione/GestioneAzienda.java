package gestione;

import java.util.List;

import bean.BustaPaga;
import bean.Voce;
import bean.Admin;
import bean.Cliente;
import bean.Dipendente;
import bean.Rubrica;
import bean.Utente;
import dao.AdminDao;
import dao.BustaPagaDao;
import dao.ClienteDao;
import dao.DipendenteDao;
import dao.RubricaDao;
import dao.UtenteDao;
import dao.VoceDao;
import utility.CodificationOfPassword;

public class GestioneAzienda {

	AdminDao aDao = new AdminDao();
	UtenteDao uDao = new UtenteDao();
	ClienteDao cDao = new ClienteDao();
	DipendenteDao dDao = new DipendenteDao();
	RubricaDao rDao = new RubricaDao();
	VoceDao vDao = new VoceDao();
	BustaPagaDao bpDao = new BustaPagaDao();
	
	
	// CODIFICA PASSWORD
	public String convertiPass(String pass) {
		return CodificationOfPassword.codificatePass(pass);
	}
	

	// UTENTE
	
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
		if (u != null && u.getPassword().equals(this.convertiPass(password))) {
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

	
	
	// ADMIN
	
	// 1- REGISTRA 
	public Admin registraAdmin(Admin ad) {
		Admin a = aDao.readAdminConUsername(ad.getUsername());
		if (a == null) {
			a = ad;
			aDao.insertAdmin(a);
		}
		return a;
	}
	
	// 2- ESISTE RETURN BOOLEAN
	public boolean existAdmin(String username) {
		boolean res = false;
		Admin a = aDao.readAdminConUsername(username);
		if (a != null) {
			res = true;
		}
		return res;
	}
	
	// 3- SET BEAN
	public void setBeanAdmin(Admin a) {
		aDao.fillDatiAdmin(a);
	}

	
	
	// CLIENTE
	
	// 1- REGISTRA
	public Cliente registraClient(Cliente cl) {
		Cliente c = cDao.readClientConUsername(cl.getUsername());
		if (c == null) {
			c = cl;
			cDao.insertClient(c);
		}
		return c;
	}

	// 2- ESISTE
	public boolean existClient(String username) {
		boolean res = false;
		Cliente c = cDao.readClientConUsername(username);
		if (c != null) {
			res = true;
		}
		return res;
	}

	// 3- READ BY ID RETURN BOOLEAN
	public boolean readClientConId(long idClient) {
		boolean res = false;
		Cliente cl = cDao.readClientConId(idClient);
		if (cl != null) {
			res = true;
		}
		return res;
	}

	// 4- UPDATE 
	public void updateClient(Cliente c) {
		cDao.updateClient(c);
	}

	// 5- DELETE 
	public void deleteClient(Cliente cl) {
		cDao.deleteClient(cl);
	}
	
	// 6- SET BEAN
	public void setBeanClient(Cliente c) {
		cDao.fillDatiClient(c);
	}
	
	// 7- LISTA CLIENTI
	public List<Cliente> readAllClient() {
		return cDao.readAllClient();
	}
	
	
	
	// DIPENDENTE
	
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

	
	
	// BUSTAPAGA
	
	// 1- REGISTRA
	public void registraBustaPaga(BustaPaga bp) {
		bpDao.insertBustaPaga(bp);
	}
	
	// 2- UPDATE 
	public void updateBustaPaga(BustaPaga bp) {
		bpDao.updateBustaPaga(bp);
	}
	
	// 3- DELETE
	public void deleteBustaPaga(BustaPaga b) {
		bpDao.deleteBustaPaga(b);
	}
	
	// 4- SET BEAN
	public void setBeanBustaPaga(BustaPaga bp) {
		bpDao.fillDatiBustaPaga(bp);
	}
	
	// 5- READ CON DATA E DIPENDENTE
	public BustaPaga readAllBustaPaga(String data, Dipendente d) {
		return bpDao.readAllBustaPaga(data, d);
	}

	// 5- READ ALL E RITORNA UNA LISTA
	public List<BustaPaga> readAll() {
		return bpDao.readAllBustaPaga();
	}

	// 5- READ CON ID
	public boolean readBustaPagaById(long id) {
		if (bpDao.readBustaPagaConId(id) != null) {
			return true;
		}
		return false;
	}

	// 5- READ CON ID E RETURN BUSTAPAGA
	public BustaPaga readBusta(long id) {
		return bpDao.readBustaPagaConId(id);
	}

	// 5- READ CON DIPENDENTE RETURN LISTA
	public List<BustaPaga> readBustaDip(Dipendente d) {
		return bpDao.readBustaPagaByDip(d);
	}

	
	
	// RUBRICA

	// 1- CREA 
	public Rubrica creaRubrica(long id) {
		Utente u = readUserById(id);
		Rubrica r = new Rubrica(u.getNome());
		r.setUtente(u);
		rDao.creaRubrica(r);
		u.setRubrica(r);
		uDao.updateUser(u);
		rDao.updateRubrica(r);
		return r;

	}
	
	// 2- READ  BY ID
	public Rubrica readRubricaById(long idR) {
		return rDao.readRubricaConId(idR);
	}

	
	
	// VOCE
	
	// 1- CREA 
	public void insertVoce(long idU, Voce v) {
		Utente u = readUserById(idU);
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

	// 3- READ BY ID
	public Voce readVoceById(long idV) {
		return vDao.readVoceConId(idV);
	}
	
	// 4- GET VOCI DELLA RUBRICA PASSATA COME PARAMETRO
	public List<Voce> getAllVoci(Rubrica r) {
		return vDao.readAllVoci(r);
	}

}
