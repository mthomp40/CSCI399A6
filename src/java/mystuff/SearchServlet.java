package mystuff;

import java.io.IOException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchServlet extends HttpServlet {

    @PersistenceUnit(unitName = "CSCI399A6PU")
    private EntityManagerFactory emf;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher rd = request.getRequestDispatcher("Searchform.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        EntityManager em = emf.createEntityManager();
        String type = request.getParameter("type");
        String venue = request.getParameter("venue");
        String fromdate = request.getParameter("fromdate");
        String todate = request.getParameter("todate");
        Query q = em.createNamedQuery("Ecpresentations.findByDateRange");
        if (type.equals("All") && !venue.equals("Any")) {
            q = em.createNamedQuery("Ecpresentations.findByVenueDateRange");
            q.setParameter("venue", venue);
        } else if (!type.equals("All") && venue.equals("Any")) {
            q = em.createNamedQuery("Ecpresentations.findByGenreDateRange");
            q.setParameter("genre", type);
        }
        q.setParameter("startseason", java.sql.Date.valueOf(fromdate));
        q.setParameter("endseason", java.sql.Date.valueOf(todate));
        List prezzos = q.getResultList();
        request.setAttribute("prezzos", prezzos);
        RequestDispatcher rd = request.getRequestDispatcher("ResultsReporter.jsp");
        rd.forward(request, response);
    }
}
