package model.service;

import model.classes.Activite;

import java.util.List;

public interface ActiviteService {

    void ajouterActivite(Activite activite);
    List<Activite> afficherActivite();
    void marqueTermine(int id);
    void supprimerActivite(int id);

}
