package scau.se37.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import scau.se37.common.service.CinemaService;
import scau.se37.dao.CinemaDao;
import scau.se37.entity.Cinema;

@Service
public class CinemaServiceImpl implements CinemaService {
	@Autowired
	private CinemaDao cinemaDao;

	@Override
	public Boolean saveCinema(Cinema cinema) {
		// TODO Auto-generated method stub
		int num=cinemaDao.saveCinema(cinema);
		if(num==1)
			return true;
		else
			return false;
	}

	@Override
	public Boolean deleteCinema(int cinemaId) {
		// TODO Auto-generated method stub
		int num=cinemaDao.deleteCinema(cinemaId);
		if(num==1)
			return true;
		else
			return false;
	}

	@Override
	public Cinema findByCinemaId(int cinemaId) {
		// TODO Auto-generated method stub
		return cinemaDao.findByCinemaId(cinemaId);
	}

	@Override
	public List<Cinema> findAllCinema() {
		// TODO Auto-generated method stub
		return cinemaDao.findAllCinema();
	}

	@Override
	public Boolean updateCinema(Cinema cinema) {
		// TODO Auto-generated method stub
		int num=cinemaDao.updateCinema(cinema);
		if(num==1)
			return true;
		else
			return false;
	}

}
