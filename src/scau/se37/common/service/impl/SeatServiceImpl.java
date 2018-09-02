package scau.se37.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import scau.se37.common.service.SeatService;
import scau.se37.dao.SeatDao;
import scau.se37.entity.Seat;

@Service
public class SeatServiceImpl implements SeatService {
	@Autowired
	private SeatDao seatDao;

	@Override
	public Boolean saveSeat(Seat seat) {
		// TODO Auto-generated method stub
		int num=seatDao.saveSeat(seat);
		if(num==1)
			return true;
		else
			return false;
	}

	@Override
	public Boolean deleteSeat(int seatId) {
		// TODO Auto-generated method stub
		int num=seatDao.deleteSeat(seatId);
		if(num==1)
			return true;
		else
			return false;
	}

	@Override
	public Seat findBySeatId(int seatId) {
		// TODO Auto-generated method stub
		return seatDao.findBySeatId(seatId);
	}

	@Override
	public List<Seat> findAllSeat() {
		// TODO Auto-generated method stub
		return seatDao.findAllSeat();
	}

	@Override
	public Boolean updateSeat(Seat seat) {
		// TODO Auto-generated method stub
		int num=seatDao.updateSeat(seat);
		if(num==1)
			return true;
		else
			return false;
	}

	@Override
	public Seat findSelectedSeat(int hallId, String seatPosition) {
		// TODO Auto-generated method stub
		Seat lSeat=seatDao.findSelectedSeat(hallId, seatPosition);
		return lSeat;
	}

	@Override
	public List<Seat> findByStatus(int hallId, int seatIsActive) {
		// TODO Auto-generated method stub
		List<Seat> selectedSeatList=seatDao.findByStatus(hallId, seatIsActive);
		return selectedSeatList;
	}

}
