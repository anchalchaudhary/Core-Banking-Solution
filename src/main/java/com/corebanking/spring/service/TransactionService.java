package com.corebanking.spring.service;

import com.corebanking.spring.model.Transaction;

public interface TransactionService 
{
	public boolean deposit(Transaction transaction);
	public boolean withdraw(Transaction transaction);
	public boolean transfer(Transaction transaction);
}
