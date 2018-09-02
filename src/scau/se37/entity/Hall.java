package scau.se37.entity;

public class Hall {
    private int hallId;

    private String hallName;

    private String hallSeats;

    private String hallType;
    
    private String hallDescription;
    
    private int cinemaId;

	public int getHallId() {
		return hallId;
	}

	public void setHallId(int hallId) {
		this.hallId = hallId;
	}

	public String getHallName() {
		return hallName;
	}

	public void setHallName(String hallName) {
		this.hallName = hallName;
	}

	public String getHallSeats() {
		return hallSeats;
	}

	public void setHallSeats(String hallSeats) {
		this.hallSeats = hallSeats;
	}

	public String getHallType() {
		return hallType;
	}

	public void setHallType(String hallType) {
		this.hallType = hallType;
	}
	
	public String getHallDescription() {
		return hallDescription;
	}
	
	public void setHallDescription(String hallDescription) {
		this.hallDescription = hallDescription;
	}
	
	public int getCinemaId() {
		return cinemaId;
	}

	public void setCinemaId(int cinemaId) {
		this.cinemaId = cinemaId;
	}
	
	
}