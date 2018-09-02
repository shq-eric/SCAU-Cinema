package scau.se37.common.service;

import java.util.List;

import scau.se37.entity.Customer;


public interface CustomerService {

	 
	 //���ӿͻ�
    public Boolean saveCustomer(Customer customer);
    //ɾ���ͻ�
    public Boolean deleteCustomer(int customerId);
    //ͨ��id���ҿͻ�
    public Customer findByCustomerId(int customerId);
    //通过用户名查询
    public Customer findByCustomer(Customer customer);
    //�������пͻ�
    public List<Customer> findAllCustomer();
    //�޸Ŀͻ���Ϣ
    public Boolean updateCustomer(Customer customer); 
    //根据用户名和密码判断是否有该用户
    public Customer login(String customUsername,String customPassword);
    //根据用户名判断该用户名是否已存在
    public Boolean checkUsername(String customUsername);
   
}
