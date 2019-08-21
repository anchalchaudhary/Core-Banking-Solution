package com.corebanking.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.corebanking.spring.model.Account;
import com.corebanking.spring.model.Branch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.corebanking.spring.model.Customer;
import com.corebanking.spring.model.PersonalTransaction;
import com.corebanking.spring.model.Transaction;
import com.corebanking.spring.service.AccountService;
import com.corebanking.spring.service.CustomerService;

import com.corebanking.spring.service.EmployeeService;
import com.corebanking.spring.service.TransactionService;

@Controller
public class EmployeeController {

	
	private EmployeeService employeeService;
	@Autowired

	private TransactionService transactionService;

	@Autowired
	private CustomerService customerService;

	@Autowired(required = true)
	private AccountService accountService;
	
	public EmployeeController() {

	}

	@Autowired
	public EmployeeController(EmployeeService employeeService) {
	}

	@Autowired(required = true)
	public void setEmployeeService(EmployeeService employeeService) {

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
	
	@RequestMapping(value = {"/addCustomer","updateCustomer/addCustomer"}, method = RequestMethod.POST)
	public ModelAndView addNewCustomer(@ModelAttribute Customer customer, BindingResult bindingResult) {

//		ModelAndView modelAndView = new ModelAndView("redirect:/home");
		if (bindingResult.hasErrors()) {
			return new ModelAndView("error");
		}
		if(customer.getCustomerId()==0) {
			boolean isAdded = employeeService.addCustomer(customer);
			if(isAdded) {
				int customerId = customer.getCustomerId();
//				modelAndView.addObject("message", "New Customer successfully added");
				return new ModelAndView("redirect:/viewCustomer/"+customerId);
			} else {
				return new ModelAndView("error");
			}
		} else {
			int customerId = customer.getCustomerId();
			employeeService.updateCustomer(customer);
			return new ModelAndView("redirect:/viewCustomer/"+customerId);
		}
	}

	@RequestMapping(value = "/listCustomers", method = RequestMethod.GET)
	public String showCustomerList(Model model) {
		List<Customer> list = employeeService.getAllCustomers();
		for(Customer customer:list)
		{
			System.out.println(customer.getName()+" "+customer.getCustomerId());

		}
		model.addAttribute("list", list);
		return "listCustomers";
	}

	@RequestMapping(value = "/viewCustomer/{id}", method = RequestMethod.GET)
	public String viewCustomer(@PathVariable("id") int id, Model model) {
		
//		Customer customer = this.employeeService.getCustomerDetails(id).orElse(null);
		model.addAttribute("customer", this.employeeService.getCustomerDetails(id).orElse(null));
//		model.addAttribute("account", this.employeeService.getCustomerAccountDetails(customer));
		
		return "viewCustomer";	
	}

	@RequestMapping(value = "/updateCustomer/{id}", method = RequestMethod.GET)
	public String updateCustomer(@PathVariable("id") int id, Model model) {
		model.addAttribute("customer", this.customerService.getCustomerById(id).orElse(null));

		return "createCustomer";
	}
	
	@RequestMapping(value = "/deleteCustomer/{id}",method=RequestMethod.GET)
    public String deleteCustomer(@PathVariable("id") int id,Model model)
    {
    	customerService.deleteCustomer(customerService.getCustomerById(id).orElse(null));
    	List<Customer> list=employeeService.getAllCustomers();
    	model.addAttribute("list", list);
    	return "listCustomers";
    }

	@RequestMapping(value = "/createAccount/{id}" , method = RequestMethod.GET)
	public ModelAndView showAccountCreation(@PathVariable("id") int id, Model model)
	{
		ModelAndView modelAndView = new ModelAndView("createAccount");
		modelAndView.addObject("headermessage", "Add Account Details");
		modelAndView.addObject("customerId", id);
		modelAndView.addObject("account", new Account());
		return modelAndView;
	}
	
	@RequestMapping(value = "/createAccount/{id}",method = RequestMethod.POST)
	public ModelAndView createAccount(@PathVariable("id") int customerId, @ModelAttribute("account") Account account, BindingResult bindingResult)
	{

		ModelAndView modelAndView = new ModelAndView("redirect:/viewCustomer/"+customerId);
		if(bindingResult.hasErrors()) {
			return new ModelAndView("error");
		}
		Customer customer = customerService.getCustomerById(customerId).orElse(null);
		account.setCustomer(customer);
//		boolean isRegistered = employeeService.isRegistered(account.getCustomer());
//		if(isRegistered) {
			boolean isAdded = employeeService.createAccount(account);
			if(isAdded) {
				modelAndView.addObject("message", "New Customer Account successfully added");
			} else {
				return new ModelAndView("error");
			}
//		} else {
//			return new ModelAndView("error");
//		}
		return modelAndView;	
	}

	@RequestMapping(value="/transfer/{fromAccountId}", method = RequestMethod.GET)
	public ModelAndView showTransferForm(@PathVariable("fromAccountId") int fromAccountId)
	{
		ModelAndView modelAndView = new ModelAndView("transfer");
		modelAndView.addObject("fromAccountId", fromAccountId);
		modelAndView.addObject("transfer", new Transaction());
		return modelAndView;
	}
	
	@RequestMapping(value="/transfer/transfer/{fromAccountId}",method = RequestMethod.POST)
	public ModelAndView addTransfer(@PathVariable("fromAccountId") int fromAccountId, @ModelAttribute("transfer") Transaction transaction, BindingResult bindingResult)
	{
		Account fromAccount = accountService.getAccountById(fromAccountId);
		transaction.setFromaccount(fromAccount);
		ModelAndView modelAndView = new ModelAndView("redirect:/viewCustomer/"+fromAccount.getCustomer().getCustomerId());
		if (bindingResult.hasErrors()) {
			return new ModelAndView("error");
		}
		transactionService.transfer(transaction);
		return modelAndView;
	}
	
	@RequestMapping(value="/depositMoney/{id}", method = RequestMethod.GET)
	public ModelAndView showDepositMoneyForm(@PathVariable("id")int id) {
		ModelAndView modelAndView = new ModelAndView("depositMoney");
		modelAndView.addObject("accountId", id);
		modelAndView.addObject("personalTransaction", new PersonalTransaction());
		return modelAndView;
	}
	
	@RequestMapping(value="/depositMoney/depositMoney/{id}", method = RequestMethod.POST)
	public ModelAndView depositMoney(@PathVariable("id") int accountId, @ModelAttribute("personalTransaction") PersonalTransaction personalTransaction, BindingResult bindingResult) {
		
		Account account = accountService.getAccountById(accountId);
		int customerId = account.getCustomer().getCustomerId();
		ModelAndView modelAndView = new ModelAndView("redirect:/viewCustomer/"+customerId);
		personalTransaction.setAccount(account);
		if (bindingResult.hasErrors()) {
			return new ModelAndView("error");
		}
		
		transactionService.deposit(personalTransaction);
		return modelAndView;
	}
	
	@RequestMapping(value="/withdrawMoney/{id}", method = RequestMethod.GET)
	public ModelAndView showWithdrawMoneyForm(@PathVariable("id")int id) {
		ModelAndView modelAndView = new ModelAndView("withdrawMoney");
		modelAndView.addObject("accountId", id);
		modelAndView.addObject("personalTransaction", new PersonalTransaction());
		return modelAndView;
	}
	
	@RequestMapping(value="/withdrawMoney/withdrawMoney/{id}", method = RequestMethod.POST)
	public ModelAndView withdrawMoney(@PathVariable("id") int accountId, @ModelAttribute("personalTransaction") PersonalTransaction personalTransaction, BindingResult bindingResult) {
		
		Account account = accountService.getAccountById(accountId);
		int customerId = account.getCustomer().getCustomerId();
		ModelAndView modelAndView = new ModelAndView("redirect:/viewCustomer/"+customerId);
		personalTransaction.setAccount(account);
		if (bindingResult.hasErrors()) {
			return new ModelAndView("error");
		}
		
		transactionService.withdraw(personalTransaction);
		return modelAndView;
	}
}
