package controller.trip;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TicketDao;
import model.Ticket;

/**
 * Servlet implementation class ListTicketController
 */
@WebServlet("/listticket")
public class ListTicketController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TicketDao ticketDao = new TicketDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListTicketController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Ticket> tickets = null;
		tickets = ticketDao.ListAllTicket();
		request.setAttribute("ticket", tickets);
		request.getRequestDispatcher("/views/trip/list_ticket.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Ticket> tickets = null;
		String option = request.getParameter("filter-option");
		String search = request.getParameter("search");
		if("customer".equalsIgnoreCase(option)) {
			tickets = ticketDao.searchByName(search);
			request.setAttribute("ticket", tickets);
		} else if("trip".equalsIgnoreCase(option)) {
			tickets = ticketDao.searchByTrip(search);
			request.setAttribute("ticket", tickets);
		}
		request.getRequestDispatcher("/views/trip/list_ticket.jsp").forward(request, response);
	}
	
	

}
