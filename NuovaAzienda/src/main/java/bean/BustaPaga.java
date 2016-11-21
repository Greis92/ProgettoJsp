package bean;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;


@Entity
public class BustaPaga implements Serializable, IsValid{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id 
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long idBustaPaga;
	
	@ManyToOne(fetch = FetchType.EAGER)
	private Dipendente dip;
	
	private String dataEmissione;
	private int oreLavorate;
	private double importo;
	
	
	public BustaPaga() {}
	
	public BustaPaga(String dataEmissione, int oreLavorate,
			double importo) {
		this.dataEmissione = dataEmissione;
		this.oreLavorate = oreLavorate;
		this.importo = importo;
	}

	public long getIdBustaPaga() {
		return idBustaPaga;
	}

	public void setIdBustaPaga(long idBustaPaga) {
		this.idBustaPaga = idBustaPaga;
	}

	public Dipendente getDip() {
		return dip;
	}

	public void setDip(Dipendente dip) {
		this.dip = dip;
	}

	public String getDataEmissione() {
		return dataEmissione;
	}

	public void setDataEmissione(String dataEmissione) {
		this.dataEmissione = dataEmissione;
	}

	public int getOreLavorate() {
		return oreLavorate;
	}

	public void setOreLavorate(int oreLavorate) {
		this.oreLavorate = oreLavorate;
	}

	public double getImporto() {
		return importo;
	}

	public void setImporto(double importo) {
		this.importo = importo;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public String getNomeCognome(){
		return dip.getNome()+" "+dip.getCognome();
	}

	@Override
	public boolean isValid() {
		boolean res=false;
		
		if(   
			  (this.dip != null) &&
			  (!this.dataEmissione.isEmpty() && this.dataEmissione != null)	&&
			  (this.oreLavorate != 0) &&
			  (this.importo != 0)
			  
		){
			
			res = true;
			
		}
		
		return res;
	}

	
}
