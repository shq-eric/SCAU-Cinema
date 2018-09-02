package scau.se37.entity;

public class Administrator {
    private int administratorId;

    private String administratorName;

    private String adminstratorPassword;

    private String administratorPhone;

	private String administratorEmail;
    
    private String administratorLevel;
    
    private int cinemaId;
   
	public int getAdministratorId() {
		return administratorId;
	}

	public void setAdministratorId(int administratorId) {
		this.administratorId = administratorId;
	}

	public String getAdministratorName() {
		return administratorName;
	}

	public void setAdministratorName(String administratorName) {
		this.administratorName = administratorName;
	}

	public String getAdministratorPassword() {
		return adminstratorPassword;
	}

	public void setAdministratorPassword(String adminstratorPassword) {
		this.adminstratorPassword = adminstratorPassword;
	}

	public String getAdministratorPhone() {
		return administratorPhone;
	}

	public void setAdministratorPhone(String administratorPhone) {
		this.administratorPhone = administratorPhone;
	}

	public String getAdministratorEmail() {
		return administratorEmail;
	}

	public void setAdministratorEmail(String administratorEmail) {
		this.administratorEmail = administratorEmail;
	}

	public String getAdministratorLevel() {
		return administratorLevel;
	}

	public void setAdministratorLevel(String administratorLevel) {
		this.administratorLevel = administratorLevel;
	}

	public int getCinemaId() {
		return cinemaId;
	}

	public void setCinemaId(int cinemaId) {
		this.cinemaId = cinemaId;
	}
    
	
}