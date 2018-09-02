package scau.se37.common.service;

import java.util.List;

import scau.se37.entity.Administrator;

public interface AdministratorService {
	public Boolean saveAdministrator(Administrator administrator);
    
    public Boolean deleteAdministrator(int administratorId);
    
    public Administrator findByAdministratorId(int administratorId);
    
    public List<Administrator> findAllAdministrator();
    
    public Boolean updateAdministrator(Administrator administrator); 
    
    public Administrator checkLogin(String administratorName,String adminstratorPassword);
    
    public Boolean isNameExist(String administractorName);
}
