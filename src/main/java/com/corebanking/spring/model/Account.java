package com.corebanking.spring.model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Account 
{
	@OneToOne
    @JoinColumn(name="customerId")
	private Customer customerId;
	private String accountno;
	private long balance;
	
	@ManyToOne(optional = false)
    @JoinColumn(name="branchId")
	private Branch branchId;
	
	public Customer getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Customer customerId) {
		this.customerId = customerId;
	}
	public String getAccountno() {
		return accountno;
	}
	public void setAccountno(String accountno) {
		this.accountno = accountno;
	}
	public long getBalance() {
		return balance;
	}
	public void setBalance(long balance) {
		this.balance = balance;
	}
	public Branch getBranchId() {
		return branchId;
	}
	public void setBranchId(Branch branchId) {
		this.branchId = branchId;
	}
	



}
