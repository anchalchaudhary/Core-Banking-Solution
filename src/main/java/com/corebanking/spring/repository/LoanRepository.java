package com.corebanking.spring.repository;

import com.corebanking.spring.model.Account;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.corebanking.spring.model.Customer;
import com.corebanking.spring.model.Employee;
import com.corebanking.spring.model.Loan;

@Repository
public interface LoanRepository extends CrudRepository<Loan, Integer>{

}
