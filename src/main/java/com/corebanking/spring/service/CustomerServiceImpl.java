package com.corebanking.spring.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.corebanking.spring.model.Customer;
import com.corebanking.spring.repository.CustomerRepository;

@Service
public class CustomerServiceImpl implements CustomerService{

	private CustomerRepository customerRepository;
	public CustomerServiceImpl() {
		// TODO Auto-generated constructor stub
	}
	@Autowired
	public CustomerServiceImpl(CustomerRepository customerRepository) {
		super();
		this.customerRepository = customerRepository;
	}
	@Override
	public Optional<Customer> getCustomerById(int id) {

		Optional<Customer> customer = customerRepository.findById(id);
		return customer;
	}

}
