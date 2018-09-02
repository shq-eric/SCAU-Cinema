package scau.se37.dao;

import java.util.List;

import scau.se37.entity.Hall;


public interface HallDao {
   

    //保存hall
    public int saveHall(Hall hall);
    //删除hall
    public int deleteHall(int hallId);
    //ͨ根据Id查询hall
    public Hall findByHallId(int hallId);
    //查询所有hall
    public List<Hall> findAllHall();
    //更新hall
    public int updateHall(Hall hall);
}