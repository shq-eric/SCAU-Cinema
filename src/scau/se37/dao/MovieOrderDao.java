package scau.se37.dao;

import java.util.List;

import scau.se37.entity.MovieOrder;

public interface MovieOrderDao {
    public int saveMovieOrder(MovieOrder movieOrder);
	
	public int deleteMovieOrder(int movieOrderId);
    
    public MovieOrder findByMovieOrderId(int movieOrderId);
    
    
    public List<MovieOrder> findAllMovieOrder();
   
    public int updateMovieOrder(MovieOrder movieOrder);
}
