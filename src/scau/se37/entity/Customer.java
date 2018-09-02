package scau.se37.entity;

public class Customer {
    private int customId=0;

    private String customUsername="";

    private String customPassword="";

    private String customTel="";

	public int getCustomId() {
		return customId;
	}

	public void setCustomId(int customId) {
		this.customId = customId;
	}

	public String getCustomUsername() {
		return customUsername;
	}

	public void setCustomUsername(String customUsername) {
		this.customUsername = customUsername;
	}

	public String getCustomPassword() {
		return customPassword;
	}

	public void setCustomPassword(String customPassword) {
		this.customPassword = customPassword;
	}

	public String getCustomTel() {
		return customTel;
	}

	public void setCustomTel(String customTel) {
		this.customTel = customTel;
	}

   
}