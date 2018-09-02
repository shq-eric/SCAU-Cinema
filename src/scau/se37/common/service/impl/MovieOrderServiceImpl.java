package scau.se37.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import scau.se37.common.service.MovieOrderService;
import scau.se37.dao.MovieOrderDao;
import scau.se37.entity.MovieOrder;


@Service
public class MovieOrderServiceImpl implements MovieOrderService {

	@Autowired
	private MovieOrderDao movieOrderDao;

	@Override
	public Boolean saveMovieOrder(MovieOrder movieOrder) {
		// TODO Auto-generated method stub
		int num=movieOrderDao.saveMovieOrder(movieOrder);
		if(num==1)
			return true;
		else
			return false;
	}

	@Override
	public Boolean deleteMovieOrder(int movieOrderId) {
		// TODO Auto-generated method stub
		int num=movieOrderDao.deleteMovieOrder(movieOrderId);
		if(num==1)
			return true;
		else
			return false;
	}

	@Override
	public MovieOrder findByMovieOrderId(int movieOrderId) {
		// TODO Auto-generated method stub
		return movieOrderDao.findByMovieOrderId(movieOrderId);
	}

	@Override
	public List<MovieOrder> findAllMovieOrder() {
		// TODO Auto-generated method stub
		return movieOrderDao.findAllMovieOrder();
	}

	@Override
	public Boolean updateMovieOrder(MovieOrder movieOrder) {
		// TODO Auto-generated method stub
		int num=movieOrderDao.updateMovieOrder(movieOrder);
		if(num==1)
			return true;
		else
			return false;
	}

}
