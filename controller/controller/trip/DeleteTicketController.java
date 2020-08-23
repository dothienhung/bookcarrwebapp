package controller.trip;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TicketDao;
import model.Trip;

/**
 * Servlet implementation class DeleteTicketController
 */
@WebServlet("/delete_ticket")
public class DeleteTicketController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TicketDao ticketDao = new TicketDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteTicketController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ticketId = request.getParameter("ticketId");
		String tripId = request.getParameter("tripId");
		ticketDao.deleteTicket(Integer.parseInt(ticketId));
		int count = ticketDao.getCount(Integer.parseInt(tripId));
		Trip trip = new Trip(count,Integer.parseInt(tripId));
		ticketDao.updateTrip(trip);
		response.sendRedirect(request.getContextPath() + "/listticket");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
