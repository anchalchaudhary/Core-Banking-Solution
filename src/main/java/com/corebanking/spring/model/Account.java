package com.corebanking.spring.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table
public class Account 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	private int accountId;
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	@OneToOne(cascade = CascadeType.MERGE,fetch=FetchType.EAGER)
    @JoinColumn(name="customerId")
	private Customer customer;
	private String accountno;
	private long balance;

	@ManyToOne(optional = false,fetch=FetchType.EAGER)
    @JoinColumn(name="branchId", referencedColumnName = "branchId" ,nullable = false)
	private Branch branch;
	
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
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
	public Branch getBranch() {
		return branch;
	}
	public void setBranch(Branch branch) {
		this.branch = branch;
	}
	



}
