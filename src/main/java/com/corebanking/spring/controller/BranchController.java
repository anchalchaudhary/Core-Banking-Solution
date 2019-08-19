package com.corebanking.spring.controller;

import com.corebanking.spring.model.Branch;
import com.corebanking.spring.model.Customer;
import com.corebanking.spring.service.BranchService;
import com.corebanking.spring.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class BranchController
{
    private BranchService branchService;
    @Autowired(required=true)
    public void setCustomerService(BranchService branchService){
        this.branchService = branchService;
    }
    @RequestMapping(value = "/addBranch", method = RequestMethod.GET)
	public ModelAndView showCreateBranchForm() {
		ModelAndView modelAndView = new ModelAndView("createBranch");
		modelAndView.addObject("headermessage", "Add branch Details");
		modelAndView.addObject("branch", new Branch());
		return modelAndView;
	}
	
	@RequestMapping(value = "/addBranch", method = RequestMethod.POST)
	public ModelAndView addNewBranch(@ModelAttribute Branch branch, BindingResult bindingResult) {

		ModelAndView modelAndView = new ModelAndView("redirect:/addBranch");
		if(bindingResult.hasErrors()) {
			return new ModelAndView("error");
		}


		boolean isAdded = branchService.addBranch(branch);
		
		if(isAdded) {
			modelAndView.addObject("message", "New Branch successfully added");
		} else {
			return new ModelAndView("error");
		}
		return modelAndView;
	} 
    
}
