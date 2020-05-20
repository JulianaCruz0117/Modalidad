
package Modelo;

public class Modalidad {
    int id;
    String nom;
    

    public Modalidad() {
    }

    public Modalidad(String nom) {
        this.nom = nom;
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

   
}
