package main;

//import dao.BustaPagaDao;
//import dao.AdminDao;
//import dao.ClienteDao;
//import dao.DipendenteDao;
//import dao.RubricaDao;
//import dao.VoceDao;
//import dao.UtenteDao;
//import dao.VoceDao;


import bean.Admin;
import bean.Cliente;
import bean.Dipendente;
import bean.Utente;
import gestione.GestioneAzienda;

public class ProvaAzienda {

	public static void main(String[] args) {
		
		GestioneAzienda g = new GestioneAzienda();
		
		// inserisco admin
		Utente ad = new Admin("Grazia","Digilio","Greis","greis92",'a',"dirigente");
		
		ad.setPassword(g.convertiPass(ad.getPassword()));		
		g.registraAdmin((Admin) ad);
		
		// inserisco clienti
		Utente c1 = new Cliente("Martina","Debernardi","marti","marti",'c',"spa","01236321452");
		Utente c2 = new Cliente("Francesca","Giordani","fra","fra",'c',"spa","01238321452");
		Utente c3 = new Cliente("Marco","Boemi","boe","boe",'c',"spa","01286321452");
		
		c1.setPassword(g.convertiPass(c1.getPassword()));		
		g.registraClient((Cliente) c1);
		
		c2.setPassword(g.convertiPass(c2.getPassword()));		
		g.registraClient((Cliente) c2);
		
		c3.setPassword(g.convertiPass(c3.getPassword()));		
		g.registraClient((Cliente) c3);
		
		
		// inserisco dipendenti
		Utente d1 = new Dipendente("Andrea","Laneri","gino","gino",'d',"consulente",1200);
		Utente d2 = new Dipendente("Fabrizio","Corso","fabri","fabri",'d',"consulente",1200);
		Utente d3 = new Dipendente("Viviana","Corso","vivi","vivi",'d',"consulente",1200);
		
		d1.setPassword(g.convertiPass(d1.getPassword()));		
		g.registraDipendente((Dipendente) d1);
		
		d2.setPassword(g.convertiPass(d2.getPassword()));		
		g.registraDipendente((Dipendente) d2);
		
		d3.setPassword(g.convertiPass(d3.getPassword()));		
		g.registraDipendente((Dipendente) d3);
		
		
		
		
		
		
		
	

	}
}
