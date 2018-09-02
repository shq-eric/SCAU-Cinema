package scau.se37.dao;

import java.util.List;

import scau.se37.entity.Customer;
import scau.se37.entity.Movie;

public interface MovieDao {

	public int saveMovie(Movie movie);
	
	public int deleteMovie(int movieId);
    
    public Movie findByMovieId(int movieId);
    
    public List<Movie> findByMovieStatus(String movieStatus);
    
    public List<Movie> findAllMovie();
   
    public int updateMovie(Movie movie);
    
    public int findMaxMovieId();
	
}
