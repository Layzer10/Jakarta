package com.example.jakarta;

public class Client {
    private String nom;
    private String prenom;
    private String email;
    private String telephone;

    public Client(String nom, String prenom, String email, String telephone) {
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
        this.telephone = telephone;
    }

    public String getNom()       { return nom; }
    public String getPrenom()    { return prenom; }
    public String getEmail()     { return email; }
    public String getTelephone() { return telephone; }
}