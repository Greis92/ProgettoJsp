package gestione;

import dao.AdminDao;
import bean.Admin;

public class GestioneAdmin {

	AdminDao aDao = new AdminDao();

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

}
