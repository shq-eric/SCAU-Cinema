package scau.se37.common.service;

import java.util.List;

import scau.se37.entity.Cinema;

public interface CinemaService {
	public Boolean saveCinema(Cinema cinema);
    
    public Boolean deleteCinema(int cinemaId);
    
    public Cinema findByCinemaId(int cinemaId);
    
    public List<Cinema> findAllCinema();
    
    public Boolean updateCinema(Cinema cinema); 
}
