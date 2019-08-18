package com.corebanking.spring.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import com.corebanking.spring.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.corebanking.spring.model.Account;
import com.corebanking.spring.model.Customer;
import com.corebanking.spring.repository.CustomerRepository;

@Service
public class EmployeeServiceImpl implements EmployeeService{

	private CustomerRepository customerRepository;
	private AccountRepository accountRepository;
	
	public EmployeeServiceImpl() {
		
	}
	
	@Autowired
	public EmployeeServiceImpl(CustomerRepository customerRepository) {
		super();
		this.customerRepository = customerRepository;
	}
	
	@Override
	public void branchManagement() {
		// TODO Auto-generated method stub
		
	}

	@Override
	@Transactional
	public boolean addCustomer(Customer customer) {
		try {
			customerRepository.save(customer);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}

	@Override
	public boolean createAccount(Account account)
	{
		try {
			Account account1=accountRepository.save(account);
			account1.setAccountno("GL"+account1.getId());
			accountRepository.save(account1);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}

	@Override
	public void transactionManagement() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Account getCustomerAccountDetails(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Customer getCustomerDetails(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Customer> getAllCustomers() {

		List<Customer> list = new ArrayList<Customer>();
		customerRepository.findAll().forEach(e -> list.add(e));
		return list;
	}

}
