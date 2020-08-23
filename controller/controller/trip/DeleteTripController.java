package controller.trip;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookofficeDao;
import dao.TicketDao;
import dao.TripDao;
import model.Ticket;

/**
 * Servlet implementation class DeleteTripController
 */
@WebServlet("/delete_trip")
public class DeleteTripController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TicketDao ticketDao = new TicketDao();
	private TripDao tripDao = new TripDao();
    private BookofficeDao bookofficeDao = new BookofficeDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteTripController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tripId = request.getParameter("tripId");
		int count = ticketDao.getCount(Integer.parseInt(tripId));
		int booking = bookofficeDao.getCountBooking(Integer.parseInt(tripId));
		if(count == 0 && booking==0) {
			tripDao.deleteTrip(Integer.parseInt(tripId));
		}
		response.sendRedirect(request.getContextPath() + "/listtrip");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
