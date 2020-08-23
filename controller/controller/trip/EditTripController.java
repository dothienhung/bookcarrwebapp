package controller.trip;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TicketDao;
import dao.TripDao;
import model.Trip;

/**
 * Servlet implementation class EditTripController
 */
@WebServlet("/edittrip")
public class EditTripController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TripDao tripDao = new TripDao();
	private TicketDao ticketDao = new TicketDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditTripController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("tripId");
		Trip trip = null;
		trip = tripDao.findTripById(Integer.parseInt(id));
		request.setAttribute("trip", trip);
		request.getRequestDispatcher("/views/trip/edit_trip.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tripId = Integer.parseInt(request.getParameter("tripId"));
		String destination = request.getParameter("destination");
		String time = request.getParameter("dateTime");
		String drive = request.getParameter("driver");
		String carType = request.getParameter("carType");
		int maxTicket = Integer.parseInt(request.getParameter("maxTicket"));
		String departureDate = request.getParameter("departureDate");
		int bookedTicketNumber = ticketDao.getCount(tripId);
		Trip trip = new Trip(tripId, bookedTicketNumber, carType, departureDate, time, destination, drive, maxTicket);
		tripDao.update(trip);
		response.sendRedirect(request.getContextPath() + "/listtrip");
	}

}
