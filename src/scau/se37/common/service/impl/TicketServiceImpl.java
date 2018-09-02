package scau.se37.common.service.impl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import scau.se37.common.service.TicketService;
import scau.se37.dao.TicketDao;
import scau.se37.entity.Schedule;
import scau.se37.entity.Ticket;

@Service
public class TicketServiceImpl implements TicketService {

	@Autowired
	private TicketDao ticketDao;

	@Override
	public Boolean saveTicket(Ticket ticket) {
		// TODO Auto-generated method stub
		int num=ticketDao.saveTicket(ticket);
		if(num==1)
			return true;
		else
			return false;
	}

	@Override
	public Boolean deleteTicket(int ticketId) {
		// TODO Auto-generated method stub
		int num=ticketDao.deleteTicket(ticketId);
		if(num==1)
			return true;
		else
			return false;
	}

	@Override
	public Ticket findByTicketId(int ticketId) {
		// TODO Auto-generated method stub
		return ticketDao.findByTicketId(ticketId);
	}

	@Override
	public List<Ticket> findAllTicket() {
		// TODO Auto-generated method stub
		return ticketDao.findAllTicket();
	}

	@Override
	public Boolean updateTicket(Ticket ticket) {
		// TODO Auto-generated method stub
		int num=ticketDao.updateTicket(ticket);
		if(num==1)
			return true;
		else
			return false;
	}

	@Override
	public List<Ticket> findLastTicket(int n) {
		// TODO Auto-generated method stub
		List<Ticket> ticket=ticketDao.findLastTicket(n);
		return ticket;
	}

	@Override
	public List<Ticket> findByTicketDate(int customId, Date scheduleBegin) {
		// TODO Auto-generated method stub
		List<Ticket> ticket=ticketDao.findByTicketDate(customId, scheduleBegin);
		return ticket;
	}

	@Override
	public List<Ticket> findBySchedule(Schedule schedule) {
		// TODO Auto-generated method stub
		List<Ticket> ticket=ticketDao.findBySchedule(schedule);
		return ticket;
	}

	@Override
	public List<Ticket> findByCustomId(int customId) {
		// TODO Auto-generated method stub
		List<Ticket> ticket=ticketDao.findByCustomId(customId);
		return ticket;
	}

}
