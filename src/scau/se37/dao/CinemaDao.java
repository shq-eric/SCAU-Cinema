package scau.se37.dao;

import java.util.List;

import scau.se37.entity.Cinema;

public interface CinemaDao {

	public int saveCinema(Cinema cinema);
	
	public int deleteCinema(int cinemaId);
    
    public Cinema findByCinemaId(int cinemaId);
    
    
    public List<Cinema> findAllCinema();
   
    public int updateCinema(Cinema cinema);
	
}
