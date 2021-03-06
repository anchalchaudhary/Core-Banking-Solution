package com.corebanking.spring.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.corebanking.spring.model.Transaction;

@Repository
public interface TransactionRepository extends CrudRepository<Transaction, Integer>
{

}
