package scau.se37.common.service.impl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import scau.se37.common.service.ScheduleService;
import scau.se37.dao.ScheduleDao;
import scau.se37.entity.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	@Autowired
	private ScheduleDao scheduleDao;

	@Override
	public Boolean saveSchedule(Schedule schedule) {
		// TODO Auto-generated method stub
		int num=scheduleDao.saveSchedule(schedule);
		if(num==1)
			return true;
		else
			return false;
	}

	@Override
	public Boolean deleteSchedule(int scheduleId) {
		// TODO Auto-generated method stub
		int num=scheduleDao.deleteSchedule(scheduleId);
		if(num==1)
			return true;
		else
			return false;
	}

	@Override
	public Schedule findByScheduleId(int scheduleId) {
		// TODO Auto-generated method stub
		return scheduleDao.findByScheduleId(scheduleId);
	}

	@Override
	public List<Schedule> findAllSchedule() {
		// TODO Auto-generated method stub
		return scheduleDao.findAllSchedule();
	}

	@Override
	public Boolean updateSchedule(Schedule schedule) {
		// TODO Auto-generated method stub
		int num=scheduleDao.updateSchedule(schedule);
		if(num==1)
			return true;
		else
			return false;
	}
    
	//根据开始日期查找
	@Override
	public List<Schedule> findBySheduleBegin(Date scheduleBegin) {
		// TODO Auto-generated method stub
		List<Schedule> list=scheduleDao.findBySheduleBegin(scheduleBegin);
		return list;
	}


	@Override
	public List<Schedule> findByMovieId(Date scheduleBegin, int movieId) {
		// TODO Auto-generated method stub
		List<Schedule> list=scheduleDao.findByMovieId(scheduleBegin, movieId);
		return list;
	}

	@Override
	public List<Date> findAllScheduleDate() {
		// TODO Auto-generated method stub
		List<Date> list=scheduleDao.findAllScheduleDate();
		return list;
	}

	

	//查找是否有hallId的排片
	@Override
	public Boolean findByHallId(int hallId){
		int num = scheduleDao.findByHallId(hallId);
		if(num == 0){
			return false;
		}
		return true;
	}

}
