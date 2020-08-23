package controller.trip;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TripDao;
import model.Trip;

/**
 * Servlet implementation class AddTripController
 */
@WebServlet("/addtrip")
public class AddTripController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TripDao tripDao = new TripDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTripController() {
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/trip/add_trip.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "";
		String action = request.getParameter("action");
		String destination = request.getParameter("destination");
		String time = request.getParameter("dateTime");
		String drive = request.getParameter("driver");
		String carType = request.getParameter("carType");
		int maxTicket = Integer.parseInt(request.getParameter("maxTicket"));
		String departureDate = request.getParameter("departureDate");
		int ticketBooked = 0;
		Trip trip = new Trip(ticketBooked, carType, departureDate, time, destination, drive, maxTicket);
		if("add".equalsIgnoreCase(action)) {
			tripDao.AddTrip(trip);
			url = "/listtrip";
		}else {
			url = "/addtrip";
		}
		response.sendRedirect(request.getContextPath() + url);
	}

}
