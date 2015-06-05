package mystuff;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;
import myentities.Ecperformances;
import myentities.Ecpresentations;

public class ScheduleServlet extends HttpServlet {

    @PersistenceUnit(unitName = "CSCI399A6PU")
    private EntityManagerFactory emf;
    @Resource
    private UserTransaction utx;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        if (request.getUserPrincipal() != null) {
            request.setAttribute("loggedin", request.getUserPrincipal().getName());
        }
        RequestDispatcher rd = request.getRequestDispatcher("AddshowForm.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String identifier = request.getParameter("identifier");
        String title = request.getParameter("title");
        String venue = request.getParameter("venue");
        String genre = request.getParameter("type");
        String startdate = request.getParameter("fromdate");
        String enddate = request.getParameter("todate");
        String company = request.getParameter("company");
        String shortdescription = request.getParameter("description");
        Ecpresentations prezzo = new Ecpresentations();
        prezzo.setMykey(identifier);
        prezzo.setTitle(title);
        prezzo.setVenue(venue);
        prezzo.setGenre(genre);
        prezzo.setStartseason(java.sql.Date.valueOf(startdate));
        prezzo.setEndseason(java.sql.Date.valueOf(enddate));
        prezzo.setCompany(company);
        prezzo.setShortdescription(shortdescription);
        List<Ecperformances> performancelist = new ArrayList<>();
        String performances = request.getParameter("performances");
        if (performances != null) {
            String[] shows = performances.split(";");
            for (int i = 0; i < shows.length; i++) {
                String[] parts = shows[i].split(", ");
                Ecperformances performance = new Ecperformances();
                performance.setShowdate(java.sql.Date.valueOf(parts[0].trim()));
                performance.setShowtime(parts[1]);
                performance.setShowid(prezzo);
                performancelist.add(performance);
            }
        }
        prezzo.setEcperformancesCollection(performancelist);
        try {
            utx.begin();
            EntityManager em = emf.createEntityManager();
            em.persist(prezzo);
            utx.commit();
            em.close();
        } catch (NotSupportedException | SystemException | RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException ex) {
            Logger.getLogger(ScheduleServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (request.getUserPrincipal() != null) {
            request.setAttribute("loggedin", request.getUserPrincipal().getName());
        }
        RequestDispatcher rd = request.getRequestDispatcher("ScheduleAcknowledge.jsp");
        rd.forward(request, response);
    }
}
