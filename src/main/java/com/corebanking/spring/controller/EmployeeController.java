package com.corebanking.spring.controller;

import com.corebanking.spring.model.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.corebanking.spring.model.Customer;
import com.corebanking.spring.service.EmployeeService;

@Controller
public class EmployeeController {

	private EmployeeService employeeService;
	@Autowired(required=true)
	@Qualifier(value="employeeService")
	public void setCustomerService(EmployeeService employeeService){
		this.employeeService = employeeService;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String showLogin(Model model) {
		
		return "createCustomer";
	}
	
	@RequestMapping(value = "/addCustomer", method = RequestMethod.POST)
	public String createCustomer(@ModelAttribute("customer") Customer customer) {

		this.employeeService.addCustomer(customer);

		return "redirect:/listcustomer";
	}

	@RequestMapping(value = "/createAccount" , method = RequestMethod.GET)
	public String showAccountCreation(Model model)
	{
		return "createAccount";
	}
	@RequestMapping(value = "/addAccount",method = RequestMethod.POST)
	public String createAccount(@ModelAttribute("account") Account account)
	{
		this.employeeService.createAccount(account);
		return "redirect:/listcustomer";
	}

}
