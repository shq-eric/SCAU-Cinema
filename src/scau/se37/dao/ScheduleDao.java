package scau.se37.dao;

import java.sql.Date;
import java.util.List;

import scau.se37.entity.Schedule;

public interface ScheduleDao {

	public int saveSchedule(Schedule schedule);
	
	public int deleteSchedule(int scheduleId);
    
    public Schedule findByScheduleId(int scheduleId);
    
    
    public List<Schedule> findAllSchedule();
   
    public int updateSchedule(Schedule schedule);
	//通过开始日期查找
    public List<Schedule> findBySheduleBegin(Date scheduleBegin);

    //根据movieId,scheduleBegin查询
    public List<Schedule> findByMovieId(Date scheduleBegin,int movieId);
    //查询所有已安排时间
    public List<Date> findAllScheduleDate();

    
    public int findByHallId(int hallId);

}
