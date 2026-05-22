package model.dao;

import model.classes.Activite;

import java.util.List;

public interface ActiviteDao {

    void add(Activite activite);
    Activite getById(int id);
    List<Activite> getAll();
    void update(int id, StatutEtape statut);
    void delete(int id);

}
