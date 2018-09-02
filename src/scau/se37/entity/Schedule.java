package scau.se37.entity;

import java.sql.Date;
import java.sql.Time;

public class Schedule {
	  private int scheduleId;
	  private double schedulePrice;
	  private Date scheduleBegin;
	  private Date scheduleEnd;
	  private Time beginTime;
	  private Time endTime;
	  private int movieId;
	  private String movieName;
	  private int hallId;
	  
	public int getScheduleId() {
		return scheduleId;
	}
	public void setScheduleId(int scheduleId) {
		this.scheduleId = scheduleId;
	}
	public double getSchedulePrice() {
		return schedulePrice;
	}
	public void setSchedulePrice(double schedulePrice) {
		this.schedulePrice = schedulePrice;
	}
	public Date getScheduleBegin() {
		return scheduleBegin;
	}
	public void setScheduleBegin(Date scheduleBegin) {
		this.scheduleBegin = scheduleBegin;
	}
	public Date getScheduleEnd() {
		return scheduleEnd;
	}
	public void setScheduleEnd(Date scheduleEnd) {
		this.scheduleEnd = scheduleEnd;
	}
	public Time getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(Time beginTime) {
		this.beginTime = beginTime;
	}
	public Time getEndTime() {
		return endTime;
	}
	public void setEndTime(Time endTime) {
		this.endTime = endTime;
	}
	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public int getHallId() {
		return hallId;
	}
	public void setHallId(int hallId) {
		this.hallId = hallId;
	}
	  
	  
	
}
