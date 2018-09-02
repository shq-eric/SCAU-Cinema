package scau.se37.dao;

import java.util.List;

import scau.se37.entity.Administrator;

public interface AdministratorDao {

	public int saveAdministrator(Administrator administrator);
	
	public int deleteAdministrator(int administratorId);
    
    public Administrator findByAdministratorId(int administratorId);
    
    public Administrator findByAdministratorName(String administratorName);
    
    public List<Administrator> findAllAdministrator();
   
    public int updateAdministrator(Administrator administrator);
    
    
	
}
