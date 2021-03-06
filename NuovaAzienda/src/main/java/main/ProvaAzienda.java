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
import gestione.GestioneAdmin;
import gestione.GestioneCliente;
import gestione.GestioneDipendente;
import gestione.GestionePass;

public class ProvaAzienda {

	public static void main(String[] args) {
		
		GestioneAdmin gAdmin = new GestioneAdmin();
		GestioneCliente gCliente = new GestioneCliente();
		GestioneDipendente gDipendente = new GestioneDipendente();
		
		GestionePass gPass = new GestionePass();
		
		// inserisco admin
		Utente ad = new Admin("Grazia","Digilio","Greis","greis92",'a',"dirigente");
		
		ad.setPassword(gPass.convertiPass(ad.getPassword()));		
		gAdmin.registraAdmin((Admin) ad);
		
		// inserisco clienti
		Utente c1 = new Cliente("Martina","Debernardi","marti","marti",'c',"spa","01236321452");
		Utente c2 = new Cliente("Francesca","Giordani","fra","fra",'c',"spa","01238321452");
		Utente c3 = new Cliente("Marco","Boemi","boe","boe",'c',"spa","01286321452");
		
		c1.setPassword(gPass.convertiPass(c1.getPassword()));		
		gCliente.registraCliente((Cliente) c1);
		
		c2.setPassword(gPass.convertiPass(c2.getPassword()));		
		gCliente.registraCliente((Cliente) c2);
		
		c3.setPassword(gPass.convertiPass(c3.getPassword()));		
		gCliente.registraCliente((Cliente) c3);
		
		
		// inserisco dipendenti
		Utente d1 = new Dipendente("Andrea","Laneri","gino","gino",'d',"consulente",1200);
		Utente d2 = new Dipendente("Fabrizio","Corso","fabri","fabri",'d',"consulente",1200);
		Utente d3 = new Dipendente("Viviana","Corso","vivi","vivi",'d',"consulente",1200);
		
		d1.setPassword(gPass.convertiPass(d1.getPassword()));		
		gDipendente.registraDipendente((Dipendente) d1);
		
		d2.setPassword(gPass.convertiPass(d2.getPassword()));		
		gDipendente.registraDipendente((Dipendente) d2);
		
		d3.setPassword(gPass.convertiPass(d3.getPassword()));		
		gDipendente.registraDipendente((Dipendente) d3);
		
		
		
		
		
		
		
	

	}
}
