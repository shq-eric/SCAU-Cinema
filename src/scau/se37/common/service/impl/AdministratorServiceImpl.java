package scau.se37.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import scau.se37.common.service.AdministratorService;
import scau.se37.dao.AdministratorDao;
import scau.se37.entity.Administrator;


@Service
public class AdministratorServiceImpl implements AdministratorService {

	@Autowired
	private AdministratorDao administratorDao;

	@Override
	public Boolean saveAdministrator(Administrator administrator) {
		// TODO Auto-generated method stub
		int num=administratorDao.saveAdministrator(administrator);
		if(num==1)
			return true;
		else
			return false;
	}

	@Override
	public Boolean deleteAdministrator(int administratorId) {
		// TODO Auto-generated method stub
		int num=administratorDao.deleteAdministrator(administratorId);
		if(num==1)
			return true;
		else
			return false;
	}

	@Override
	public Administrator findByAdministratorId(int administratorId) {
		// TODO Auto-generated method stub
		return administratorDao.findByAdministratorId(administratorId);
	}

	@Override
	public List<Administrator> findAllAdministrator() {
		// TODO Auto-generated method stub
		return administratorDao.findAllAdministrator();
	}

	@Override
	public Boolean updateAdministrator(Administrator administrator) {
		// TODO Auto-generated method stub
		int num=administratorDao.updateAdministrator(administrator);
		if(num==1)
			return true;
		else
			return false;
	}

	@Override
	public Administrator checkLogin(String administratorName,String adminstratorPassword){
		Administrator administrator = administratorDao.findByAdministratorName(administratorName);
		if(administrator != null && administrator.getAdministratorPassword().equals(adminstratorPassword)){
			return administrator;
		}
		return null;
	}
	
	//用户名是否存在
	@Override
	public Boolean isNameExist(String administratorName){
		Administrator administrator = administratorDao.findByAdministratorName(administratorName);
		//administrator 存在
		if(administrator != null)
			return true;
		
		return false;
	}
}
