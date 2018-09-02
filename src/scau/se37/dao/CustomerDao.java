package scau.se37.dao;

import java.util.List;

import scau.se37.entity.Customer;


public interface CustomerDao {
   

    //���ӿͻ�
    public int saveCustomer(Customer customer);
    //ɾ���ͻ�
    public int deleteCustomer(int customerId);
    //ͨ��id���ҿͻ�
    public Customer findByCustomerId(int customerId);
    //通过用户对象来查询
    public Customer findByCustomer(Customer customer);
    //�������пͻ�
    public List<Customer> findAllCustomer();
    //�޸Ŀͻ���Ϣ
    public int updateCustomer(Customer customer);
}