package com.corebanking.spring.dao;

import com.corebanking.spring.model.Customer;

public interface EmployeeDao {

	public void branchManagement();
	public void addCustomer(Customer customer);
	public void createAccount(Customer customer);
	public void transactionManagement();
}