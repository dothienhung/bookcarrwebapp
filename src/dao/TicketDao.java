/*
 * (C) Copyright 2020 Fresher Academy
 * @author Admin
 * @date Mar 15, 2020
 * @version 1.0
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.DBConnection;
import model.Employee;
import model.Ticket;
import model.Trip;
import utils.SQLQuery;

public class TicketDao {
	private Connection connection;
	private PreparedStatement preparedStatement;
	private ResultSet resultSet;

	public int getCount(int tripId) {
		int count = 0;
		try {
			connection = DBConnection.getInstance().getConnection();
			preparedStatement = connection.prepareStatement(SQLQuery.COUNT_TICKET);
			preparedStatement.setInt(1, tripId);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				count = resultSet.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (resultSet != null) {
					resultSet.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;
	}

	public List<Ticket> ListAllTicket() {
		List<Ticket> tickets = new ArrayList<Ticket>();
		Ticket ticket = null;
		try {
			connection = DBConnection.getInstance().getConnection();
			preparedStatement = connection.prepareStatement(SQLQuery.LIST_ALL_TICKET);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				int ticketId = resultSet.getInt(1);
				String trip = resultSet.getString(2);
				String name = resultSet.getString(3);
				String licensePlate = resultSet.getString(4);
				String bookingTime = resultSet.getString(5);
				int tripId = resultSet.getInt(6);
				ticket = new Ticket(trip,ticketId, bookingTime, name, licensePlate,tripId);
				tickets.add(ticket);
			}
			return tickets;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (resultSet != null) {
					resultSet.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;

	}
	
	public List<Ticket> searchByTrip(String tri) {
		List<Ticket> tickets = new ArrayList<Ticket>();
		Ticket ticket = null;
		try {
			connection = DBConnection.getInstance().getConnection();
			preparedStatement = connection.prepareStatement(SQLQuery.SEARCH_BY_TRIP);
			preparedStatement.setString(1, tri);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				int ticketId = resultSet.getInt(1);
				String trip = resultSet.getString(2);
				String name = resultSet.getString(3);
				String licensePlate = resultSet.getString(4);
				String bookingTime = resultSet.getString(5);

				ticket = new Ticket(trip,ticketId, bookingTime, name, licensePlate);
				tickets.add(ticket);
			}
			return tickets;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (resultSet != null) {
					resultSet.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;

	}
	
	public List<Ticket> searchByName(String customer) {
		List<Ticket> tickets = new ArrayList<Ticket>();
		Ticket ticket = null;
		try {
			connection = DBConnection.getInstance().getConnection();
			preparedStatement = connection.prepareStatement(SQLQuery.SEARCH_BY_CUSTOMER);
			preparedStatement.setString(1, customer);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				int ticketId = resultSet.getInt(1);
				String trip = resultSet.getString(2);
				String name = resultSet.getString(3);
				String licensePlate = resultSet.getString(4);
				String bookingTime = resultSet.getString(5);

				ticket = new Ticket(trip,ticketId, bookingTime, name, licensePlate);
				tickets.add(ticket);
			}
			return tickets;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (resultSet != null) {
					resultSet.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;

	}
	
	public boolean deleteTicket(int ticketId) {
		try {
			connection = DBConnection.getInstance().getConnection();
			preparedStatement = connection.prepareCall(SQLQuery.DELETE_TICKET);
			preparedStatement.setInt(1, ticketId);
			int result = preparedStatement.executeUpdate();
			return result > 0;
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
				if (preparedStatement != null) {
					preparedStatement.close();
				}
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return false;
		
	}
	
	public boolean deleteTicketByTrip(int tripId) {
		try {
			connection = DBConnection.getInstance().getConnection();
			preparedStatement = connection.prepareCall(SQLQuery.DELETE_TICKET_BYTRIP);
			preparedStatement.setInt(1, tripId);
			int result = preparedStatement.executeUpdate();
			return result > 0;
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
				if (preparedStatement != null) {
					preparedStatement.close();
				}
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return false;
	}
	
	public boolean deleteTicketByPlate(String plate) {
		try {
			connection = DBConnection.getInstance().getConnection();
			preparedStatement = connection.prepareCall(SQLQuery.DELETE_TICKET_BY_PLATE);
			preparedStatement.setString(1, plate);
			int result = preparedStatement.executeUpdate();
			return result > 0;
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
				if (preparedStatement != null) {
					preparedStatement.close();
				}
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return false;
	}
	
	public int getCountCar(String plate) {
		ArrayList<Ticket> list = new ArrayList();
		int count = 0;
		try {
			connection = DBConnection.getInstance().getConnection();
			preparedStatement = connection.prepareStatement(SQLQuery.COUNT_TICKETOFCAR);
			preparedStatement.setString(1, plate);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				count = resultSet.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (resultSet != null) {
					resultSet.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;
	}
	
	public boolean updateTrip(Trip trip) {
		try {
			connection = DBConnection.getInstance().getConnection();
			preparedStatement = connection.prepareStatement(SQLQuery.UPDATE_TICKET);
			preparedStatement.setInt(1, trip.getBookedTicketNumber());
			preparedStatement.setInt(2, trip.getTripId());

			int rs = preparedStatement.executeUpdate();
			return rs > 0;
		}

		catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (resultSet != null) {
					resultSet.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
		
	}
	
}
