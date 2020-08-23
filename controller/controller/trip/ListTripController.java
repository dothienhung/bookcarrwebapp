package controller.trip;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TripDao;
import model.Trip;

/**
 * Servlet implementation class ListTripController
 */
@WebServlet("/listtrip")
public class ListTripController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TripDao tripDao = new TripDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListTripController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Trip> trips = null;
		trips = tripDao.ListAllTrip();
		request.setAttribute("trip", trips);
		request.getRequestDispatcher("/views/trip/list_trip.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Trip> trips = null;
		String option = request.getParameter("filter-option");
		String search = request.getParameter("search");
		if("destination".equalsIgnoreCase(option)) {
			trips = tripDao.findByDes(search);
			request.setAttribute("trip", trips);
		}else {
			trips = tripDao.findByDriver(search);
			request.setAttribute("trip", trips);
		}
		request.getRequestDispatcher("/views/trip/list_trip.jsp").forward(request, response);
		
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String tripId = req.getParameter("tripId");
		tripDao.deleteTrip(Integer.parseInt(tripId));
	}

}
