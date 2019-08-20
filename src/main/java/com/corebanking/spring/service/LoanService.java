package com.corebanking.spring.service;

import java.util.List;

import com.corebanking.spring.model.Loan;

public interface LoanService 
{
	public boolean addLoan(Loan loan);
	public boolean updateLoan(Loan loan);
	public List<Loan> getLoanList();
	public Loan getLoanById(int id);
	public boolean deleteLoan(Loan loan);
	

}
