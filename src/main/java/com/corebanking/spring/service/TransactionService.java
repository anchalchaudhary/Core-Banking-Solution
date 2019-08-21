package com.corebanking.spring.service;

import com.corebanking.spring.model.PersonalTransaction;
import com.corebanking.spring.model.Transaction;

public interface TransactionService 
{
	public void deposit(PersonalTransaction personalTransaction);
	public void withdraw(PersonalTransaction personalTransaction);
	public boolean transfer(Transaction transaction);
}
