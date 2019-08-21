package com.corebanking.spring.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class PersonalTransaction {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int ptId;

	@ManyToOne
    @JoinColumn(name="accountId")
	private Account account;
	
	private int sum;

	public int getPtId() {
		return ptId;
	}

	public void setPtId(int ptId) {
		this.ptId = ptId;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}
	
	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}
}
