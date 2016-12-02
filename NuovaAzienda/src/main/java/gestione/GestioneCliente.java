package gestione;

import java.util.List;

import bean.Cliente;
import dao.ClienteDao;

public class GestioneCliente {

	ClienteDao cDao = new ClienteDao();

	// 1- REGISTRA
	public Cliente registraCliente(Cliente cl) {
		Cliente c = cDao.readClienteConUsername(cl.getUsername());
		if (c == null) {
			c = cl;
			cDao.insertCliente(c);
		}
		return c;
	}

	// 2- ESISTE
	public boolean existCliente(String username) {
		boolean res = false;
		Cliente c = cDao.readClienteConUsername(username);
		if (c != null) {
			res = true;
		}
		return res;
	}

	// 3- READ BY ID RETURN BOOLEAN
	public boolean readClienteConId(long idClient) {
		boolean res = false;
		Cliente cl = cDao.readClienteConId(idClient);
		if (cl != null) {
			res = true;
		}
		return res;
	}

	// 4- UPDATE
	public void updateCliente(Cliente c) {
		cDao.updateCliente(c);
	}

	// 5- DELETE
	public void deleteCliente(Cliente cl) {
		cDao.deleteCliente(cl);
	}

	// 6- SET BEAN
	public void setBeanCliente(Cliente c) {
		cDao.fillDatiCliente(c);
	}

	// 7- LISTA CLIENTI
	public List<Cliente> readAllCliente() {
		return cDao.readAllCliente();
	}

}
