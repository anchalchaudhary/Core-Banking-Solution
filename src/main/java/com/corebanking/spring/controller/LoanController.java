package com.corebanking.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.corebanking.spring.model.Loan;
import com.corebanking.spring.service.LoanService;

@Controller
public class LoanController 
{
	@Autowired
	private LoanService loanService;
	
	@RequestMapping(value = "/addLoan",method = RequestMethod.GET)
	public String showLoanForm(Model model)
	{
		model.addAttribute("loan",new Loan());
		return "createLoan";
	}
	@RequestMapping(value = {"/addLoan","updateLoan/addLoan"}, method = RequestMethod.POST)
	public ModelAndView addNewLoan(@ModelAttribute Loan loan, BindingResult bindingResult) {

		ModelAndView modelAndView = new ModelAndView("redirect:/addLoan");
		if(bindingResult.hasErrors()) {
			return new ModelAndView("error");
		}

		if(loan.getId()==0)
		{
			loanService.addLoan(loan);
		}
		else
		{
			loanService.updateLoan(loan);
		}		
		return modelAndView;
	} 

	@RequestMapping(value = "/listLoan", method = RequestMethod.GET)
	public String showListLoan(Model model)
	{
    	
    	List<Loan> list=loanService.getLoanList();
    	for(Loan loan:list)
    	{
    		System.out.println(loan.getRate()+" "+loan.getId());
    	}
    	model.addAttribute("list", list);
    	return "listLoan";
		
	}

    @RequestMapping(value="/updateLoan/{id}",method = RequestMethod.GET)
    public String updateLoan(@PathVariable("id") int id, Model model)
    {
    	model.addAttribute("loan", this.loanService.getLoanById(id));
    	
        return "createLoan";
    }

    @RequestMapping(value = "/deleteLoan/{id}",method=RequestMethod.GET)
    public String deleteLoan(@PathVariable("id") int id,Model model)
    {
    	loanService.deleteLoan(loanService.getLoanById(id));
    	List<Loan> list=loanService.getLoanList();
    	model.addAttribute("list", list);
    	return "listLoan";
    }
}
