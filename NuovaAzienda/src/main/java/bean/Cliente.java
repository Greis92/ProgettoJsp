package bean;

import java.io.Serializable;

import javax.persistence.Entity;

@Entity
public class Cliente extends Utente implements Serializable,IsValid{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String ragioneSociale;
	private String partitaIva;
	
	public Cliente() {
		super();
	}

	public Cliente(String nome, String cognome,
			String username, String password, char ruolo,
			String ragioneSociale, String partitaIva) {
		
		super(nome,cognome,username,password,ruolo);
		this.ragioneSociale = ragioneSociale;
		this.partitaIva = partitaIva;
		
	}

	public String getRagioneSociale() {
		return ragioneSociale;
	}

	public void setRagioneSociale(String ragioneSociale) {
		this.ragioneSociale = ragioneSociale;
	}

	public String getPartitaIva() {
		return partitaIva;
	}

	public void setPartitaIva(String partitaIva) {
		this.partitaIva = partitaIva;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}