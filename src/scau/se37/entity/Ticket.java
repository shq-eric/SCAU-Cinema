package scau.se37.entity;

import java.sql.Date;
import java.sql.Time;

public class Ticket {

	 private int ticketId;
	 private int movieId;
	 private int customId;
	 private String movieName;
	 private int scheduleId;
	 private String cinemaAddress;
	 private int hallId;
	 private String ticketSeat;
	 private Date scheduleBegin;
	 private Time beginTime;
	 private double schedulePrice;
	 
	public int getTicketId() {
		return ticketId;
	}
	public void setTicketId(int ticketId) {
		this.ticketId = ticketId;
	}
	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	public int getCustomId() {
		return customId;
	}
	public void setCustomId(int customId) {
		this.customId = customId;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public int getScheduleId() {
		return scheduleId;
	}
	public void setScheduleId(int scheduleId) {
		this.scheduleId = scheduleId;
	}
	public String getCinemaAddress() {
		return cinemaAddress;
	}
	public void setCinemaAddress(String cinemaAddress) {
		this.cinemaAddress = cinemaAddress;
	}
	public int getHallId() {
		return hallId;
	}
	public void setHallId(int hallId) {
		this.hallId = hallId;
	}
	public String getTicketSeat() {
		return ticketSeat;
	}
	public void setTicketSeat(String ticketSeat) {
		this.ticketSeat = ticketSeat;
	}
	public Date getScheduleBegin() {
		return scheduleBegin;
	}
	public void setScheduleBegin(Date scheduleBegin) {
		this.scheduleBegin = scheduleBegin;
	}
	public Time getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(Time beginTime) {
		this.beginTime = beginTime;
	}
	public double getSchedulePrice() {
		return schedulePrice;
	}
	public void setSchedulePrice(double schedulePrice) {
		this.schedulePrice = schedulePrice;
	}
	 
	
	
	 
}
