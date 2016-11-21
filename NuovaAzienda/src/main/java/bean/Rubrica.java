package bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

@Entity
public class Rubrica implements Serializable,IsValid{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// ATTRIBUTI
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long id_rubrica;
	
	private String name;
	
	@OneToMany(fetch=FetchType.EAGER, mappedBy="rubrica",cascade = CascadeType.ALL)
	@NotFound(action = NotFoundAction.IGNORE) // POSSO CREARE UNA RUBRICA VUOTA
	Set<Voce> listaVoci = new HashSet<Voce>();
	
	@OneToOne
	private Utente utente;
	
	// COSTRUTTORE VUOTO
	public Rubrica() {
		this.name="";
	}
	
	// COSTRUTTORE CON NOME
	public Rubrica(String name) {
		this.name = name;
	}
	
	// METODI GET E SET
	public long getId_rubrica() {
		return id_rubrica;
	}

	public void setId_rubrica(long id_rubrica) {
		this.id_rubrica = id_rubrica;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public void addVoce(Voce voce){
		this.listaVoci.add(voce);
	}

	public Set<Voce> getListaVoci() {
		return listaVoci;
	}

	public void setListaVoci(Set<Voce> listaVoci) {
		this.listaVoci = listaVoci;
	}

	public Utente getUtente() {
		return utente;
	}

	public void setUtente(Utente utente) {
		this.utente = utente;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public boolean isValid() {
		boolean res=false;
		
		if(!this.name.isEmpty() && this.name != null){
			res = true;
		}
		
		return res;
	}
	
	
	
}
