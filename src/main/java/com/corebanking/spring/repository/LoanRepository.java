package com.corebanking.spring.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.corebanking.spring.model.Loan;

@Repository
public interface LoanRepository extends CrudRepository<Loan, Integer>{

}
