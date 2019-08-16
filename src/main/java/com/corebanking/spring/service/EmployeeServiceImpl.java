package com.corebanking.spring.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.corebanking.spring.dao.EmployeeDao;
import com.corebanking.spring.model.Customer;

@Service
public class EmployeeServiceImpl implements EmployeeService{

	private EmployeeDao employeeDao;
	
	@Override
	public void branchManagement() {
		// TODO Auto-generated method stub
		
	}

	@Override
	@Transactional
	public void addCustomer(Customer customer) {

		this.employeeDao.addCustomer(customer);
	}

	@Override
	public void createAccount(Customer customer) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void transactionManagement() {
		// TODO Auto-generated method stub
		
	}

}
