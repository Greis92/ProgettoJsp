package bean;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToOne;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;


@Entity
@Inheritance(strategy=InheritanceType.JOINED) // EREDITARIETA'
public class Utente implements Serializable,IsValid{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id 
	@GeneratedValue(strategy=GenerationType.AUTO)
	protected long id_utente;
	
	protected String nome;
	protected String cognome;
	
	protected String username;
	protected String password;
	
	protected char ruolo;
	
	@OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@NotFound(action = NotFoundAction.IGNORE)
	protected Rubrica rubrica;

	public Utente() {
		this.nome = "";
		this.cognome = "";
		this.username = "";
		this.password = "";
		this.ruolo = 0;
	}

	public Utente(String nome, String cognome,
			String username, String password, char ruolo) {
		
		this.nome = nome;
		this.cognome = cognome;
		this.username = username;
		this.password = password;
		this.ruolo = ruolo;
	}

	public long getId_utente() {
		return id_utente;
	}

	

	public void setId_utente(long id_utente) {
		this.id_utente = id_utente;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public char getRuolo() {
		return ruolo;
	}

	public void setRuolo(char ruolo) {
		this.ruolo = ruolo;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public Rubrica getRubrica() {
		return rubrica;
	}

	public void setRubrica(Rubrica rubrica) {
		this.rubrica = rubrica;
	}

	public boolean isValid() {
		boolean res=false;
		
		if(   (!this.nome.isEmpty() && this.nome != null)&&
			  (!this.cognome.isEmpty() && this.cognome != null)&&
			  (!this.username.isEmpty() && this.username != null)&&
			  (!this.password.isEmpty() && this.password != null)
		){
			
			res = true;
			
		}
		
		return res;
		
	}
	
	public boolean isValidLogin() {
		boolean res=false;
		
		if(   
			  (!this.username.isEmpty() && this.username != null)&&
			  (!this.password.isEmpty() && this.password != null)	
		){
			
			res = true;
			
		}
		
		return res;
		
	}
	

}
