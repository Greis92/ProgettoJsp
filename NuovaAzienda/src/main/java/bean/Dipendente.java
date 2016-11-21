package bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

@Entity
public class Dipendente extends Utente implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String posizione;
	private double stipendio;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "dip", cascade = CascadeType.ALL)
	@NotFound(action = NotFoundAction.IGNORE)
	private Set<BustaPaga> bustePaga = new HashSet<BustaPaga>();

	
	public Dipendente() {
		super();
	}

	public Dipendente(String nome, String cognome,
			String username, String password, char ruolo,
			String posizione, double stipendio) {
		
		super(nome,cognome,username,password,ruolo);
		this.posizione = posizione;
		this.stipendio = stipendio;
		
	}

	public String getPosizione() {
		return posizione;
	}

	public void setPosizione(String posizione) {
		this.posizione = posizione;
	}

	public double getStipendio() {
		return stipendio;
	}

	public void setStipendio(double stipendio) {
		this.stipendio = stipendio;
	}
	
	public Set<BustaPaga> getBustePaga() {
		return bustePaga;
	}

	public void setBustePaga(Set<BustaPaga> bustePaga) {
		this.bustePaga = bustePaga;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	

}