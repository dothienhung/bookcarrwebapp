/*
 * (C) Copyright 2020 Fresher Academy
 * @author Admin
 * @date Mar 10, 2020
 * @version 1.0
 */
package model;

public class Trip extends Bookingoffice {
	private int tripId;
	private int bookedTicketNumber;
	private String carType;
	private String departureDate;
	private String departureTime;
	private String destination;
	private String driver;
	private int maximumOnlineTicketNumber;
	
	public Trip() {
		super();
	}

	public Trip(String destination) {
		super();
		this.destination = destination;

	}
	
	public Trip(int bookedTicketNumber, int tripId) {
		super();
		this.tripId = tripId;
		this.bookedTicketNumber = bookedTicketNumber;
	}

	public Trip(String endContractDeadline, String officeName, String officePhone, String officePlace, int officePrice,
			String startContractDeadline, int tripId, String destination) {
		super(endContractDeadline, officeName, officePhone, officePlace, officePrice, startContractDeadline, tripId);
		this.destination = destination;
	}

	public Trip(int officeId, String officeName, String destination) {
		super(officeId, officeName);
		this.destination = destination;
	}

	public Trip(int bookedTicketNumber, String carType, String departureDate, String departureTime, String destination,
			String driver, int maximumOnlineTicketNumber) {
		super();
		this.bookedTicketNumber = bookedTicketNumber;
		this.carType = carType;
		this.departureDate = departureDate;
		this.departureTime = departureTime;
		this.destination = destination;
		this.driver = driver;
		this.maximumOnlineTicketNumber = maximumOnlineTicketNumber;
	}

	public Trip(int tripId, int bookedTicketNumber, String carType, String departureDate, String departureTime,
			String destination, String driver, int maximumOnlineTicketNumber) {
		super();
		this.tripId = tripId;
		this.bookedTicketNumber = bookedTicketNumber;
		this.carType = carType;
		this.departureDate = departureDate;
		this.departureTime = departureTime;
		this.destination = destination;
		this.driver = driver;
		this.maximumOnlineTicketNumber = maximumOnlineTicketNumber;
	}
	


	public int getTripId() {
		return tripId;
	}

	public void setTripId(int tripId) {
		this.tripId = tripId;
	}

	public int getBookedTicketNumber() {
		return bookedTicketNumber;
	}

	public void setBookedTicketNumber(int bookedTicketNumber) {
		this.bookedTicketNumber = bookedTicketNumber;
	}

	public String getCarType() {
		return carType;
	}

	public void setCarType(String carType) {
		this.carType = carType;
	}

	public String getDepartureDate() {
		return departureDate;
	}

	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}

	public String getDepartureTime() {
		return departureTime;
	}

	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getDriver() {
		return driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}

	public int getMaximumOnlineTicketNumber() {
		return maximumOnlineTicketNumber;
	}

	public void setMaximumOnlineTicketNumber(int maximumOnlineTicketNumber) {
		this.maximumOnlineTicketNumber = maximumOnlineTicketNumber;
	}

}
