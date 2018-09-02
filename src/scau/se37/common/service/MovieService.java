package scau.se37.common.service;

import java.util.List;

import scau.se37.entity.Movie;



public interface MovieService {

	
		
		    public Boolean saveMovie(Movie movie);
		    
		    public Boolean deleteMovie(int movieId);
		    
		    public Movie findByMovieId(int movieId);
		    
		    public List<Movie> findAllMovie();
		    
		    public List<Movie> findByMovieStatus(String movieStatus);
		    
		    public Boolean updateMovie(Movie movie); 

		    public int findMaxMovieId();
	

}
