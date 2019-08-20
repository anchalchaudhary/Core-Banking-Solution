package com.corebanking.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.corebanking.spring.model.Account;
import com.corebanking.spring.model.Transaction;
import com.corebanking.spring.repository.AccountRepository;
import com.corebanking.spring.repository.TransactionRepository;

@Service
public class TransactionServiceImpl implements TransactionService
{
	@Autowired 
	private TransactionRepository transactionRepository;
	
	@Autowired
	private AccountRepository accountRepository;
	
	@Override
	public boolean deposit(Transaction transaction) {
		return false;
	}

	@Override
	public boolean withdraw(Transaction transaction) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean transfer(Transaction transaction) {
		try {
			transactionRepository.save(transaction);
			Account fromaccount=accountRepository.findById(transaction.getFromaccount().getAccountId()).get();
			Account toaccount=accountRepository.findById(transaction.getToaccount().getAccountId()).get();
			fromaccount.setBalance(fromaccount.getBalance()-transaction.getAmount());
			toaccount.setBalance(toaccount.getBalance()-transaction.getAmount());
			accountRepository.save(fromaccount);
			accountRepository.save(toaccount);


			return true;
		}catch(Exception ex) {
			return false;
		}
	}
	

}
