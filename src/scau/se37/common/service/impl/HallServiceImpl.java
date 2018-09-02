package scau.se37.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import scau.se37.common.service.HallService;
import scau.se37.dao.HallDao;
import scau.se37.entity.Hall;

@Service
public class HallServiceImpl implements HallService {
	@Autowired
	private HallDao hallDao;

	@Override
	public Boolean saveHall(Hall hall) {
		// TODO Auto-generated method stub
		int num=hallDao.saveHall(hall);
		if(num==1)
			return true;
		else
			return false;
	}

	@Override
	public Boolean deleteHall(int hallId) {
		// TODO Auto-generated method stub
		int num=hallDao.deleteHall(hallId);
		if(num==1)
			return true;
		else
			return false;
	}

	@Override
	public Hall findByHallId(int hallId) {
		// TODO Auto-generated method stub
		return hallDao.findByHallId(hallId);
	}

	@Override
	public List<Hall> findAllHall() {
		// TODO Auto-generated method stub
		return hallDao.findAllHall();
	}

	@Override
	public Boolean updateHall(Hall hall) {
		// TODO Auto-generated method stub
		int num=hallDao.updateHall(hall);
		if(num==1)
			return true;
		else
			return false;
	}

}
