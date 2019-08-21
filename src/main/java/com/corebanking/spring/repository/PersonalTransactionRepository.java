package com.corebanking.spring.repository;

import org.springframework.data.repository.CrudRepository;

import com.corebanking.spring.model.PersonalTransaction;

public interface PersonalTransactionRepository extends CrudRepository<PersonalTransaction, Integer> {

}
