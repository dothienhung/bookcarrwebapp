/*
 * (C) Copyright 2020 Fresher Academy
 * @author Admin
 * @date Mar 13, 2020
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
import model.Parkinglot;
import model.Trip;
import utils.SQLQuery;

public class TripDao {
	private Connection connection;
	private PreparedStatement preparedStatement;
	private ResultSet resultSet;

	public List<Trip> ListAllTrip() {
		List<Trip> trips = new ArrayList<Trip>();
		Trip trip = null;
		try {
			connection = DBConnection.getInstance().getConnection();
			preparedStatement = connection.prepareStatement(SQLQuery.LIST_ALL_TRIP);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				int tripId = resultSet.getInt(1);
				int bookedTicketNumber = resultSet.getInt(2);
				String carType = resultSet.getString(3);
				String departureDate = resultSet.getString(4);
				String departureTime = resultSet.getString(5);
				String destination = resultSet.getString(6);
				String driver = resultSet.getString(7);
				int maximumOnlineTicketNumber = resultSet.getInt(8);
				trip = new Trip(tripId, bookedTicketNumber, carType, departureDate, departureTime, destination, driver,
						maximumOnlineTicketNumber);
				trips.add(trip);
			}
			return trips;
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
	
	public List<Trip> findByDes(String des) {
		List<Trip> trips = new ArrayList<Trip>();
		Trip trip = null;
		try {
			connection = DBConnection.getInstance().getConnection();
			preparedStatement = connection.prepareStatement(SQLQuery.FIND_BY_DES);
			preparedStatement.setString(1, des);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				int tripId = resultSet.getInt(1);
				int bookedTicketNumber = resultSet.getInt(2);
				String carType = resultSet.getString(3);
				String departureDate = resultSet.getString(4);
				String departureTime = resultSet.getString(5);
				String destination = resultSet.getString(6);
				String driver = resultSet.getString(7);
				int maximumOnlineTicketNumber = resultSet.getInt(8);
				trip = new Trip(tripId, bookedTicketNumber, carType, departureDate, departureTime, destination, driver,
						maximumOnlineTicketNumber);
				trips.add(trip);
			}
			return trips;
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

	public boolean AddTrip(Trip trip) {
		try {
			connection = DBConnection.getInstance().getConnection();
			preparedStatement = connection.prepareStatement(SQLQuery.ADD_TRIP);
			preparedStatement.setInt(1, trip.getBookedTicketNumber());
			preparedStatement.setString(2, trip.getCarType());
			preparedStatement.setString(3, trip.getDepartureDate());
			preparedStatement.setString(4, trip.getDepartureTime());
			preparedStatement.setString(5, trip.getDestination());
			preparedStatement.setString(6, trip.getDriver());
			preparedStatement.setInt(7, trip.getMaximumOnlineTicketNumber());

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

	public Trip findTripById(int id) {
		Trip trip = new Trip();
		try {
			connection = DBConnection.getInstance().getConnection();
			preparedStatement = connection.prepareStatement(SQLQuery.FIND_TRIP_BYID);
			preparedStatement.setInt(1, id);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				int tripId = resultSet.getInt(1);
				int bookedTicketNumber = resultSet.getInt(2);
				String carType = resultSet.getString(3);
				String departureDate = resultSet.getString(4);
				String departureTime = resultSet.getString(5);
				String destination = resultSet.getString(6);
				String driver = resultSet.getString(7);
				int maximumOnlineTicketNumber = resultSet.getInt(8);
				trip = new Trip(tripId, bookedTicketNumber, carType, departureDate, departureTime, destination, driver,
						maximumOnlineTicketNumber);
			}
			return trip;
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
	
	public boolean update(Trip trip) {
		try {
			connection = DBConnection.getInstance().getConnection();
			preparedStatement = connection.prepareStatement(SQLQuery.UPDATE_TRIP);
			preparedStatement.setString(1, trip.getCarType());
			preparedStatement.setString(2, trip.getDepartureDate());
			preparedStatement.setString(3, trip.getDepartureTime());
			preparedStatement.setString(4, trip.getDestination());
			preparedStatement.setString(5, trip.getDriver());
			preparedStatement.setInt(6, trip.getMaximumOnlineTicketNumber());
			preparedStatement.setInt(7, trip.getTripId());

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
	
	public boolean deleteTrip(int tripId) {
		try {
			connection = DBConnection.getInstance().getConnection();
			preparedStatement = connection.prepareCall(SQLQuery.DELETE_TRIP);
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

	public List<Trip> findByDriver(String search) {
		List<Trip> trips = new ArrayList<Trip>();
		Trip trip = null;
		try {
			connection = DBConnection.getInstance().getConnection();
			preparedStatement = connection.prepareStatement(SQLQuery.FIND_BY_DRIVER);
			preparedStatement.setString(1, search);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				int tripId = resultSet.getInt(1);
				int bookedTicketNumber = resultSet.getInt(2);
				String carType = resultSet.getString(3);
				String departureDate = resultSet.getString(4);
				String departureTime = resultSet.getString(5);
				String destination = resultSet.getString(6);
				String driver = resultSet.getString(7);
				int maximumOnlineTicketNumber = resultSet.getInt(8);
				trip = new Trip(tripId, bookedTicketNumber, carType, departureDate, departureTime, destination, driver,
						maximumOnlineTicketNumber);
				trips.add(trip);
			}
			return trips;
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
}
