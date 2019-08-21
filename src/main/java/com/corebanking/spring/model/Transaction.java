package com.corebanking.spring.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Transaction 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;	
	@ManyToOne(fetch = FetchType.EAGER)
	private Account fromaccount;
	@ManyToOne(fetch = FetchType.EAGER)
	private Account toaccount;
	private long amount;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Account getFromaccount() {
		return fromaccount;
	}
	public void setFromaccount(Account fromaccount) {
		this.fromaccount = fromaccount;
	}
	public Account getToaccount() {
		return toaccount;
	}
	public void setToaccount(Account toaccount) {
		this.toaccount = toaccount;
	}
	public long getAmount() {
		return amount;
	}
	public void setAmount(long amount) {
		this.amount = amount;
	}
	

}
