package scau.se37.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import scau.se37.common.service.StatisticsService;
import scau.se37.dao.StatisticsDao;
import scau.se37.entity.Statistics;
import scau.se37.entity.Ticket;

@Service
public class StatisticsServiceImpl implements StatisticsService {

	@Autowired
	private StatisticsDao statisticsDao;

	@Override
	public List<Statistics> CountMovie() {
		// TODO Auto-generated method stub
		List<Statistics> SList=statisticsDao.CountMovie();
		return SList;
	}

}
