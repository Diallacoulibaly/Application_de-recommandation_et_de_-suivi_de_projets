package model.classes;

import model.enums.StatutProjet;

import java.util.ArrayList;
import java.util.List;

public class Projet {

    private int id;
    private String titre;
    private String description;
    private float duree;
    private double budgetMin;
    private double budgetMax;
    private StatutProjet projetStatut;

    /*
    private List<Etape> etapes;            // Relation "Contenir" (1..*)
    private List<Commentaire> commentaires; // Relation "Concerner" (1..*)
    private List<ProjetClient> realisations; // Relation "Realiser" (1..*)
    */

    public Projet(int id, String titre, String description, float duree, double budgetMin, double budgetMax) {
        this.id = id;
        this.titre = titre;
        this.description = description;
        this.duree = duree;
        this.budgetMin = budgetMin;
        this.budgetMax = budgetMax;

        /*
        this.etapes = new ArrayList<>();
        this.commentaires = new ArrayList<>();
        this.realisations = new ArrayList<>();
         */
    }

    public Projet(){}


    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitre() { return titre; }
    public void setTitre(String titre) { this.titre = titre; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public float getDuree() { return duree; }
    public void setDuree(float duree) { this.duree = duree; }

    public StatutProjet getProjetStatut(){ return projetStatut; }

    public void setProjetStatut(StatutProjet statutProjet){
        this.projetStatut = statutProjet;
    }

    public double getBudgetMin() { return budgetMin; }
    public void setBudgetMin(double budgetMin) { this.budgetMin = budgetMin; }

    public double getBudgetMax() { return budgetMax; }
    public void setBudgetMax(double budgetMax) { this.budgetMax = budgetMax; }

    // Getters et Setters pour manipuler les associations
    /*
    public List<Etape> getEtapes() { return etapes; }
    public void setEtapes(List<Etape> etapes) { this.etapes = etapes; }

    public List<Commentaire> getCommentaires() { return commentaires; }
    public void setCommentaires(List<Commentaire> commentaires) { this.commentaires = commentaires; }

    public List<ProjetClient> getRealisations() { return realisations; }
    public void setRealisations(List<ProjetClient> realisations) { this.realisations = realisations; }

    */


}