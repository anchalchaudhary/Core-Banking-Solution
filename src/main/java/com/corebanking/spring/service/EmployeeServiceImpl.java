package com.corebanking.spring.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import com.corebanking.spring.repository.AccountRepository;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.corebanking.spring.model.Account;

import org.springframework.beans.factory.annotation.Qualifier;
import com.corebanking.spring.model.Branch;

import com.corebanking.spring.model.Customer;
import com.corebanking.spring.model.Employee;
import com.corebanking.spring.repository.CustomerRepository;
import com.corebanking.spring.repository.EmployeeRepository;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private EmployeeRepository employeeRepository;

	@Autowired
	BranchService branchServiceImpl;

	public BranchService getBranchServiceImpl() {
		return branchServiceImpl;
	}

	public void setBranchServiceImpl(BranchService branchServiceImpl) {
		this.branchServiceImpl = branchServiceImpl;
	}

	@Autowired
	CustomerService customerServiceImpl;

	public CustomerService getCustomerServiceImpl() {
		return customerServiceImpl;
	}

	public void setCustomerServiceImpl(CustomerService customerServiceImpl) {
		this.customerServiceImpl = customerServiceImpl;
	}

	@Autowired
	@Qualifier(value = "accountRepository")

	private AccountRepository accountRepository;

	public EmployeeServiceImpl() {

	}

	@Autowired 
	public EmployeeServiceImpl(CustomerRepository customerRepository){ 
		super(); 
		this.customerRepository = customerRepository; 
	} 
	public EmployeeServiceImpl(AccountRepository accountRepository) { 
		super();
		this.accountRepository = accountRepository; 
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
		} catch (Exception ex) {
			return false;
		}
	}

	@Override
	public boolean createAccount(Account account) {
		try {
			//			BranchService branchService = new BranchServiceImpl();
			Branch branch2 = account.getBranch();
			Branch branch = branchServiceImpl.getBranchById(branch2.getBranchId()).orElse(null);
			account.setBranch(branch);
			Customer customer2 = account.getCustomer();
			Customer customer = customerServiceImpl.getCustomerById(customer2.getCustomerId()).orElse(null);
			account.setCustomer(customer);
			Account account1 = new Account();
			account1=accountRepository.save(account);
			account1.setAccountno("GL" + account1.getAccountId());

			accountRepository.save(account1);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();

			return false;
		}
	}

	@Override
	public void transactionManagement() {
		// TODO Auto-generated method stub

	}

//	@Override
//	public Account getCustomerAccountDetails(Customer customer) {
//
//		Account account = new Account();
//		account.setAccountId(customer.getAccount().getAccountId());
//		account.setAccountno(customer.getAccount().getAccountno());
//		account.setBalance(customer.getAccount().getBalance());
//		account.setBranch(customer.getAccount().getBranch());
//		
//		return account;
//	}

	@Override
	public Optional<Customer> getCustomerDetails(int id) {

		Optional<Customer> customer = customerRepository.findById(id);
		return customer;
	}

	@Override
	public List<Customer> getAllCustomers() {

		List<Customer> list = new ArrayList<Customer>();
		customerRepository.findAll().forEach(e -> list.add(e));
		return list;
	}



	@Override
	public boolean isRegistered(Customer customerId) {

		if (customerRepository.findById(customerId.getCustomerId()) != null)
			return true;
		return false;
	}


	@Override
	@Transactional
	public boolean updateCustomer(Customer customer) {
		try {
			customerRepository.save(customer);
			return true;
		} catch (Exception ex) {
			return false;
		}
	}


	public Employee findEmployeeByUsername(String username)
	{
		Employee employee=employeeRepository.findEmployeeByEmpUserName(username);
		return employee;
	}


}
