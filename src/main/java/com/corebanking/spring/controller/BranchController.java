package com.corebanking.spring.controller;

<<<<<<< HEAD
=======
import com.corebanking.spring.model.Branch;
import com.corebanking.spring.model.Customer;
import com.corebanking.spring.service.BranchService;
import com.corebanking.spring.service.EmployeeService;

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

import com.corebanking.spring.service.BranchService;

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
	
	@RequestMapping(value = {"/addBranch","updateBranch/addBranch"}, method = RequestMethod.POST)
	public ModelAndView addNewBranch(@ModelAttribute Branch branch, BindingResult bindingResult) {

		ModelAndView modelAndView = new ModelAndView("redirect:/addBranch");
		if(bindingResult.hasErrors()) {
			return new ModelAndView("error");
		}




		if(branch.getBranchId()==0)

		{
			branchService.addBranch(branch);
		}
		else
		{
			branchService.updateBranch(branch);
	public String showListBranches(Model model)
	{
    	
    	List<Branch> list=branchService.getAllBranches();
    	for(Branch branch:list)
    	{

    		System.out.println(branch.getName()+" "+branch.getId());

    		System.out.println(branch.getName()+" "+branch.getBranchId());

    	}
    	model.addAttribute("list", list);
    	return "listBranch";
		
	}

    @RequestMapping(value="/updateBranch/{id}",method = RequestMethod.GET)
    public String updateBranch(@PathVariable("id") int id, Model model)
    {
    	model.addAttribute("branch", this.branchService.getBranchById(id).orElse(null));
    	
        return "createBranch";
    }

    @RequestMapping(value = "/deleteBranch/{id}",method=RequestMethod.GET)
    public String deleteBranch(@PathVariable("id") int id,Model model)
    {
    	branchService.deleteBranch(branchService.getBranchById(id).orElse(null));
    	List<Branch> list=branchService.getAllBranches();
    	model.addAttribute("list", list);
    	return "listBranch";
    }
}
