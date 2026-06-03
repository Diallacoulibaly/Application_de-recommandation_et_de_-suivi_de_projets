package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.classes.Etape;
import model.DaoImplement.EtapeTable;

import java.io.IOException;
import java.util.List;

@WebServlet("/etapes")
public class EtapeServlet extends HttpServlet {

    private final EtapeTable etapeTable = new EtapeTable();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Récupération de la liste des étapes via votre implémentation DAO
            List<Etape> listeEtapes = etapeTable.Liste_etape();

            // Envoi de la liste à la JSP
            request.setAttribute("etapes", listeEtapes);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("erreur", "Erreur lors de la récupération des données : " + e.getMessage());
        }

        // Redirection vers votre vue dans le dossier webapp
        request.getRequestDispatcher("/views/liste-etapes.jsp").forward(request, response);
    }
}
