package scau.se37.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import scau.se37.common.service.CustomerService;
import scau.se37.dao.CustomerDao;
import scau.se37.entity.Customer;


//�����ͻ���ҵ���
@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private CustomerDao customerDao;

	@Override
	public Boolean saveCustomer(Customer customer) {
		// TODO Auto-generated method stub
		int num=customerDao.saveCustomer(customer);
		if(num==1)
			return true;
		else
			return false;
	}

	@Override
	public Boolean deleteCustomer(int customerId) {
		// TODO Auto-generated method stub
		int num=customerDao.deleteCustomer(customerId);
		if(num==1)
			return true;
		else
			return false;
	}

	@Override
	public Customer findByCustomerId(int customerId) {
		// TODO Auto-generated method stub
		return customerDao.findByCustomerId(customerId);
	}
	
	@Override
	public Customer findByCustomer(Customer customer){
		return customerDao.findByCustomer(customer);
	}

	@Override
	public List<Customer> findAllCustomer() {
		// TODO Auto-generated method stub
		return customerDao.findAllCustomer();
	}
	

	@Override
	public Boolean updateCustomer(Customer customer) {
		// TODO Auto-generated method stub
		int num=customerDao.updateCustomer(customer);
		if(num==1)
			return true;
		else
			return false;
	}

	@Override
	public Customer login(String customUsername, String customPassword) {
		// TODO Auto-generated method stub
		Customer cus;
		Customer customer=new Customer();
		customer.setCustomUsername(customUsername);
		customer.setCustomPassword(customPassword);
		List<Customer> list=customerDao.findAllCustomer();
		for(int i=0;i<list.size();i++){
			cus=list.get(i);
			if(cus.getCustomUsername().equals(customUsername)&&
					cus.getCustomPassword().equals(customPassword))
				return cus;
		}
		return null;
	}

	@Override
	public Boolean checkUsername(String customUsername) {
		// TODO Auto-generated method stub
		Customer cus;
		List<Customer> list=customerDao.findAllCustomer();
		for(int i=0;i<list.size();i++){
			cus=list.get(i);
			if(cus.getCustomUsername().equals(customUsername))
				return false;
		}
		return true;
	}

}
