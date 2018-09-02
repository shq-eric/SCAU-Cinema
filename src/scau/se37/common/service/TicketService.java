package scau.se37.common.service;

import java.sql.Date;
import java.util.List;

import scau.se37.entity.Schedule;
import scau.se37.entity.Ticket;

public interface TicketService {
	public Boolean saveTicket(Ticket ticket);
    
    public Boolean deleteTicket(int ticketId);
    
    public Ticket findByTicketId(int ticketId);
    
    public List<Ticket> findAllTicket();
    
    public Boolean updateTicket(Ticket ticket); 
    //找最后n行数据
    public List<Ticket> findLastTicket(int n);
    //根据客户ID和订票日期查询
    public List<Ticket> findByTicketDate(int customId,Date scheduleBegin);
    //根据Schedule成员进行查询
    public List<Ticket> findBySchedule(Schedule schedule);
    //根据CustomId查询
    public List<Ticket> findByCustomId(int customId);
}
