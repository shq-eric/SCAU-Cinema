package scau.se37.common.service;

import java.util.List;

import scau.se37.entity.Hall;

public interface HallService {
	public Boolean saveHall(Hall hall);
    
    public Boolean deleteHall(int hallId);
    
    public Hall findByHallId(int hallId);
    
    public List<Hall> findAllHall();
    
    public Boolean updateHall(Hall hall); 
}
