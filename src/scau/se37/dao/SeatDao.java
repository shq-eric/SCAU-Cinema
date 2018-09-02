package scau.se37.dao;

import java.util.List;

import scau.se37.entity.Seat;

public interface SeatDao {

	public int saveSeat(Seat seat);
	
	public int deleteSeat(int seatId);
    
    public Seat findBySeatId(int seatId);
    
    
    public List<Seat> findAllSeat();
    
    public Seat findSelectedSeat(int hallId,String seatPosition);
    
    public List<Seat> findByStatus(int hallId,int seatIsActive);
   
    public int updateSeat(Seat seat);
    
	
}
