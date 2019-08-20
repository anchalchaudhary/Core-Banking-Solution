package com.corebanking.spring.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.corebanking.spring.model.Customer;
import com.corebanking.spring.model.Loan;
import com.corebanking.spring.repository.AccountRepository;
import com.corebanking.spring.repository.CustomerRepository;
import com.corebanking.spring.repository.LoanRepository;
@Service
public class LoanServiceImpl implements LoanService{

	@Autowired
	private CustomerRepository customerRepository;
	@Autowired
	private AccountRepository accountRepository;
	@Autowired
	private LoanRepository loanRepository;
	
	@Override
	public boolean addLoan(Loan loan) {
		try {
			loanRepository.save(loan);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}

	@Override
	public boolean updateLoan(Loan loan) {
		try {
			loanRepository.save(loan);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}

	@Override
	@Transactional
	public List<Loan> getLoanList() {
		List<Loan> list = new ArrayList<Loan>();
		loanRepository.findAll().forEach(e -> list.add(e));
		return list;
	}

	@Override
	public Loan getLoanById(int id) {
		Loan loan=loanRepository.findById(id).get();
		return loan;
	}

	@Override
	public boolean deleteLoan(Loan loan) {
		try {
			loanRepository.delete(loan);
			return true;
		}catch(Exception ex) {
			return false;
		}
	}

}

