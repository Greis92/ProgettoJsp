package gestione;

import utility.CodificationOfPassword;

public class GestionePass {

	// CODIFICA PASSWORD
	public String convertiPass(String pass) {
		return CodificationOfPassword.codificatePass(pass);
	}

}
