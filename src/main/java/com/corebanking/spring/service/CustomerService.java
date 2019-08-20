package com.corebanking.spring.service;

import java.util.Optional;

import com.corebanking.spring.model.Customer;;

public interface CustomerService {
    public Optional<Customer> getCustomerById(int id);

}
