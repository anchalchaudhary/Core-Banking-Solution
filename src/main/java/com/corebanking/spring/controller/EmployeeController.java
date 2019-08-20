package com.corebanking.spring.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import com.corebanking.spring.model.Account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.corebanking.spring.model.Customer;
import com.corebanking.spring.model.Transaction;
import com.corebanking.spring.service.EmployeeService;
import com.corebanking.spring.service.TransactionService;

@Controller
public class EmployeeController {

	
	private EmployeeService employeeService;
	@Autowired
	private TransactionService transactionService;

	public EmployeeController() {

	}

	@Autowired
	public EmployeeController(EmployeeService employeeService) {
	}

	@Autowired(required = true)
	public void setCustomerService(EmployeeService employeeService) {

		this.employeeService = employeeService;
	}
	@RequestMapping(value = {"/","/home"} , method = RequestMethod.GET)
	public ModelAndView showHome(HttpServletResponse response) throws IOException {

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("home");
		return modelAndView;
	}

	@RequestMapping(value = "/addCustomer", method = RequestMethod.GET)
	public ModelAndView showCreateCustomerForm() {
		ModelAndView modelAndView = new ModelAndView("createCustomer");
		modelAndView.addObject("headermessage", "Add Customer Details");
		modelAndView.addObject("customer", new Customer());
		return modelAndView;
	}
	@RequestMapping(value = "/addCustomer", method = RequestMethod.POST)
	public ModelAndView addNewCustomer(@ModelAttribute Customer customer, BindingResult bindingResult) {

		ModelAndView modelAndView = new ModelAndView("redirect:/home");
		if (bindingResult.hasErrors()) {
			return new ModelAndView("error");
		}
		boolean isAdded = employeeService.addCustomer(customer);
		if(isAdded) {
			modelAndView.addObject("message", "New Customer successfully added");
		} else {
			return new ModelAndView("error");
		}
		return modelAndView;
	}

	@RequestMapping(value = "/createAccount" , method = RequestMethod.GET)
	public ModelAndView showAccountCreation(Model model)
	{
		ModelAndView modelAndView = new ModelAndView("createAccount");
		modelAndView.addObject("headermessage", "Add Account Details");
		modelAndView.addObject("account", new Account());
		return modelAndView;
	}
	@RequestMapping(value = "/createAccount",method = RequestMethod.POST)
	public ModelAndView createAccount(@ModelAttribute("account") Account account, BindingResult bindingResult)
	{
		
		ModelAndView modelAndView = new ModelAndView("redirect:/home");
		if(bindingResult.hasErrors()) {
			return new ModelAndView("error");
		}
		boolean isRegistered = employeeService.isRegistered(account.getCustomer());
		if(isRegistered) {
			boolean isAdded = employeeService.createAccount(account);
			if(isAdded) {
				modelAndView.addObject("message", "New Customer Account successfully added");
			} else {
				return new ModelAndView("error");
			}
		} else {
			return new ModelAndView("error");
		}
		return modelAndView;	
	}

	@RequestMapping(value="/transfer", method = RequestMethod.GET)
	public String showTransferForm(Model model)
	{
		model.addAttribute("transfer", new Transaction());
		return "transfer";
	}
	
	@RequestMapping(value="/transfer",method = RequestMethod.POST)
	public String addTransfer(@ModelAttribute("transfer") Transaction transaction)
	{
		transactionService.transfer(transaction);
		return "redirect:/home";
	}
}
