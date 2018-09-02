package scau.se37.common.service;

import java.sql.Date;
import java.util.List;

import scau.se37.entity.Schedule;

public interface ScheduleService {
	public Boolean saveSchedule(Schedule schedule);
    
    public Boolean deleteSchedule(int scheduleId);
    
    public Schedule findByScheduleId(int scheduleId);
    
    public List<Schedule> findAllSchedule();
    
    public Boolean updateSchedule(Schedule schedule); 
  //通过开始日期查找
    public List<Schedule> findBySheduleBegin(Date scheduleBegin);
    

    public List<Schedule> findByMovieId(Date scheduleBegin,int movieId);
    
    public List<Date> findAllScheduleDate();

    public Boolean findByHallId(int hallId);
    

}
