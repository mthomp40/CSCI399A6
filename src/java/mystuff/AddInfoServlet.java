package mystuff;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
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
import myentities.Ecinfo;
import myentities.Ecpresentations;

public class AddInfoServlet extends HttpServlet {

    @PersistenceUnit(unitName = "CSCI399A6PU")
    private EntityManagerFactory emf;
    @Resource
    private UserTransaction utx;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher rd = request.getRequestDispatcher("AddInfo.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String identifier = request.getParameter("identifier");
        Enumeration<String> params = request.getParameterNames();
        try {
            utx.begin();
            EntityManager em = emf.createEntityManager();
            Ecpresentations prezzo = em.find(Ecpresentations.class, identifier);
            if (prezzo == null) {
                utx.rollback();
                return;
            }
            List infos = new ArrayList<>();
            while (params.hasMoreElements()) {
                String param = (String) params.nextElement();
                if (param.startsWith("img")) {
                    int num = Integer.parseInt(param.substring(3));
                    String details = request.getParameter("info" + num);
                    String picy = request.getParameter("img" + num);
                    Ecinfo info = new Ecinfo();
                    info.setPicy(picy);
                    info.setDetails(details);
                    info.setShowid(prezzo);
                    infos.add(info);
                }
            }
            prezzo.setEcinfoCollection(infos);
            em.persist(prezzo);
            utx.commit();
            em.close();
        } catch (NotSupportedException | SystemException | RollbackException | HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException ex) {
            Logger.getLogger(ScheduleServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (request.getUserPrincipal() != null) {
            request.setAttribute("loggedin", request.getUserPrincipal().getName());
        }
        request.setAttribute("showid", identifier);
        RequestDispatcher rd = request.getRequestDispatcher("AddInfo.jsp");
        rd.forward(request, response);
    }
}
