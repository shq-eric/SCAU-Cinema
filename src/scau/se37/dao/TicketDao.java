package scau.se37.dao;

import java.sql.Date;
import java.util.List;

import scau.se37.entity.Schedule;
import scau.se37.entity.Ticket;

public interface TicketDao {

	public int saveTicket(Ticket ticket);
	
	public int deleteTicket(int ticketId);
    
    public Ticket findByTicketId(int ticketId);
    
    
    public List<Ticket> findAllTicket();
   
    public int updateTicket(Ticket ticket);
    
    public List<Ticket> findLastTicket(int n);
    
    public List<Ticket> findByTicketDate(int customId,Date scheduleBegin);
	
    
    public List<Ticket> findBySchedule(Schedule schedule);
    
    public List<Ticket> findByCustomId(int customId);
}
