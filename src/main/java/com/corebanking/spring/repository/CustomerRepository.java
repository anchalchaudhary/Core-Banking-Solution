package com.corebanking.spring.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.corebanking.spring.model.Customer;

@Repository
public interface CustomerRepository extends CrudRepository<Customer, Integer>{

}
