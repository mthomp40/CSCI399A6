package mystuff;

import java.io.IOException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import myentities.Ecpresentations;

public class ShowshowServlet extends HttpServlet {

    @PersistenceUnit(unitName = "CSCI399A6PU")
    private EntityManagerFactory emf;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        EntityManager em = emf.createEntityManager();
        Query q = em.createNamedQuery("Ecpresentations.findByMykey");
        q.setParameter("mykey", request.getParameter("id"));
        Ecpresentations prezzo = (Ecpresentations) q.getSingleResult();
        request.setAttribute("prezzo", prezzo);
        request.setAttribute("performances", prezzo.getEcperformancesCollection());
        request.setAttribute("infos", prezzo.getEcinfoCollection());
        RequestDispatcher rd = request.getRequestDispatcher("ShowDetailsReporter.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
