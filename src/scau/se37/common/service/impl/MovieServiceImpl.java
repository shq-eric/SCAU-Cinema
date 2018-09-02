package scau.se37.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import scau.se37.common.service.MovieService;
import scau.se37.dao.MovieDao;
import scau.se37.entity.Movie;

@Service
public class MovieServiceImpl implements MovieService {

	@Autowired
	private MovieDao movieDao;

	@Override
	public Boolean saveMovie(Movie movie) {
		// TODO Auto-generated method stub
		int num=movieDao.saveMovie(movie);
		if(num==1)
			return true;
		else
			return false;
	}

	@Override
	public Boolean deleteMovie(int movieId) {
		// TODO Auto-generated method stub
		int num=movieDao.deleteMovie(movieId);
		if(num==1)
			return true;
		else
			return false;
	}

	@Override
	public Movie findByMovieId(int movieId) {
		// TODO Auto-generated method stub
		return movieDao.findByMovieId(movieId);
	}

	@Override
	public List<Movie> findAllMovie() {
		// TODO Auto-generated method stub
		return movieDao.findAllMovie();
	}

	@Override
	public Boolean updateMovie(Movie movie) {
		// TODO Auto-generated method stub
		int num=movieDao.updateMovie(movie);
		if(num==1)
			return true;
		else
			return false;
	}
	
	@Override
	public int findMaxMovieId(){
		return movieDao.findMaxMovieId();
	}

	@Override
	public List<Movie> findByMovieStatus(String movieStatus) {
		// TODO Auto-generated method stub
		List<Movie> movieList=movieDao.findByMovieStatus(movieStatus);
		return movieList;
	}

}
