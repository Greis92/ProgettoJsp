package gestione;

import java.util.List;

import dao.BustaPagaDao;
import bean.BustaPaga;
import bean.Dipendente;

public class GestioneBustaPaga {

	BustaPagaDao bpDao = new BustaPagaDao();

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

}
