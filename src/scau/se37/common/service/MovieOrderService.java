package scau.se37.common.service;

import java.util.List;

import scau.se37.entity.MovieOrder;

public interface MovieOrderService {

	
	
    public Boolean saveMovieOrder(MovieOrder movieOrder);
    
    public Boolean deleteMovieOrder(int movieOrderId);
    
    public MovieOrder findByMovieOrderId(int movieOrderId);
    
    public List<MovieOrder> findAllMovieOrder();
    
    public Boolean updateMovieOrder(MovieOrder movieOrder); 




}
