package com.corebanking.spring.service;

import com.corebanking.spring.model.Customer;

public interface EmployeeService {
	
	public void branchManagement();
	public void addCustomer(Customer customer);
	public void createAccount(Customer customer);
	public void transactionManagement();
}
