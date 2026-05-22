<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.classes.Etape" %>
<%@ page import="enums.StatutEtape" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion du Projet - Liste des Étapes</title>

    <!-- 1. Intégration de Bootstrap 5 via CDN -->
    <link href="https://jsdelivr.net" rel="stylesheet">

    <!-- 2. Votre fichier CSS personnalisé -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body class="bg-light application-container">

<div class="container py-5">

    <!-- Gestion des notifications d'erreurs -->
    <% if (request.getAttribute("erreur") != null) { %>
    <div class="alert alert-danger alert-dismissible fade show shadow-sm" role="alert">
        <strong>Attention :</strong> <%= request.getAttribute("erreur") %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <% } %>

    <!-- En-tête -->
    <div class="d-flex justify-content-between align-items-center mb-4 core-header">
        <div>
            <h1 class="fw-bold text-dark tracking-tight m-0">Tableau des Étapes</h1>
            <p class="text-muted small mt-1 mb-0">Consultez, modifiez et gérez l'avancement des tâches de vos projets.</p>
        </div>
        <a href="#" class="btn btn-primary px-4 py-2 custom-btn shadow-sm">
            + Ajouter une étape
        </a>
    </div>

    <!-- Conteneur principal du tableau -->
    <div class="card shadow-sm border-0 rounded-3 overflow-hidden custom-card">
        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0 custom-table">
                <thead class="table-light border-bottom text-uppercase text-secondary small fw-bold">
                <tr>
                    <th scope="col" class="px-4 py-3" style="width: 10%;">ID</th>
                    <th scope="col" class="py-3">Nom de l'étape</th>
                    <th scope="col" class="py-3">Description</th>
                    <th scope="col" class="py-3" style="width: 15%;">Projet Parent</th>
                    <th scope="col" class="py-3" style="width: 15%;">Statut</th>
                    <th scope="col" class="px-4 py-3 text-end" style="width: 15%;">Actions</th>
                </tr>
                </thead>
                <tbody class="small text-dark">
                <%
                    List<Etape> etapes = (List<Etape>) request.getAttribute("etapes");
                    if (etapes != null && !etapes.isEmpty()) {
                        for (Etape etape : etapes) {

                            // Définition dynamique des badges natifs Bootstrap 5
                            String badgeClass = "bg-secondary-subtle text-secondary";
                            if (etape.getStatutEtape() != null) {
                                switch (etape.getStatutEtape()) {
                                    case TERMINE:
                                        badgeClass = "bg-success-subtle text-success border border-success-subtle fw-semibold";
                                        break;
                                    case ENCOURS:
                                        badgeClass = "bg-warning-subtle text-warning-heading border border-warning-subtle fw-semibold";
                                        break;
                                    case AFAIRE:
                                        badgeClass = "bg-info-subtle text-info-heading border border-info-subtle fw-semibold";
                                        break;
                                }
                            }
                %>
                <tr>
                    <!-- ID Étape -->
                    <td class="px-4 font-monospace text-muted">
                        #<%= etape.getIdEtape() %>
                    </td>

                    <!-- Titre -->
                    <td class="fw-bold text-dark">
                        <%= etape.getTitre() != null ? etape.getTitre() : "Non spécifié" %>
                    </td>

                    <!-- Description -->
                    <td class="text-muted text-truncate" style="max-width: 250px;" title="<%= etape.getDescription() %>">
                        <%= etape.getDescription() != null ? etape.getDescription() : "Aucune description." %>
                    </td>

                    <!-- ID du Projet -->
                    <td>
                                <span class="badge bg-light text-dark border px-2.5 py-1.5 fw-medium text-capitalize custom-project-badge">
                                     ID: <%= (etape.getProjet() != null) ? etape.getProjet().getId() : "Aucun" %>
                                </span>
                    </td>

                    <!-- Badge de Statut -->
                    <td>
                                <span class="badge rounded-pill px-3 py-1.5 text-uppercase <%= badgeClass %>">
                                    <%= etape.getStatutEtape() != null ? etape.getStatutEtape() : "Inconnu" %>
                                </span>
                    </td>

                    <!-- Boutons d'actions -->
                    <td class="px-4 text-end">
                        <div class="d-inline-flex gap-2">
                            <a href="#" class="btn btn-sm btn-link text-primary text-decoration-none fw-bold p-0 action-link">Modifier</a>
                            <span class="text-muted">|</span>
                            <a href="#" class="btn btn-sm btn-link text-danger text-decoration-none fw-bold p-0 action-link">Supprimer</a>
                        </div>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="6" class="text-center py-5 text-muted empty-state-container">
                        <div class="fs-2 mb-2 text-secondary opacity-50">📦</div>
                        <h5 class="fw-bold text-secondary mb-1">Aucune étape disponible</h5>
                        <p class="small text-muted mb-0">La base de données ne contient aucun enregistrement pour le moment.</p>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>

</div>

<!-- Script optionnel Bootstrap 5 JS pour les composants dynamiques (comme la fermeture de l'alerte) -->
<script src="https://jsdelivr.net"></script>
</body>
</html>
