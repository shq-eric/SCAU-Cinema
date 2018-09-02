package scau.se37.common.service;

import java.util.List;

import scau.se37.entity.Seat;

public interface SeatService {
	public Boolean saveSeat(Seat seat);
    
    public Boolean deleteSeat(int seatId);
    
    public Seat findBySeatId(int seatId);
    
    public List<Seat> findAllSeat();
    
    public Seat findSelectedSeat(int hallId,String seatPosition);
    
    public List<Seat> findByStatus(int hallId,int seatIsActive);
    
    public Boolean updateSeat(Seat seat); 
}
