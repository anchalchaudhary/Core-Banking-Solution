package com.corebanking.spring.service;

import java.util.List;

import com.corebanking.spring.model.Account;
import com.corebanking.spring.model.Customer;

public interface EmployeeService {
	
	public void branchManagement();
	public boolean addCustomer(Customer customer);
	public boolean createAccount(Account account);
	public void transactionManagement();
	public Customer getCustomerDetails(int id);
	public Account getCustomerAccountDetails(int id);
	public List<Customer> getAllCustomers();
	public boolean isRegistered(Customer customer);
}
