package com.corebanking.spring.service;

import java.util.List;
import java.util.Optional;

import com.corebanking.spring.model.Account;
import com.corebanking.spring.model.Customer;
import com.corebanking.spring.model.Employee;

public interface EmployeeService {
	
	public void branchManagement();
	public boolean addCustomer(Customer customer);
	public boolean createAccount(Account account);
	public void transactionManagement();
	public Optional<Customer> getCustomerDetails(int id);
//	public Account getCustomerAccountDetails(Customer customer);
	public List<Customer> getAllCustomers();


	public boolean isRegistered(Customer customer);

	public boolean updateCustomer(Customer customer);

	Employee findEmployeeByUsername(String username);


}
