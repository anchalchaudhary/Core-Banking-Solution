package com.corebanking.spring.controller;
import com.corebanking.spring.model.Branch;
import com.corebanking.spring.service.BranchService;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.corebanking.spring.model.Branch;
import com.corebanking.spring.service.BranchService;

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
@RequestMapping(value="/branch")
public class BranchController {
	private BranchService branchService;
	private HttpSession session;
	@Autowired(required = true)
	public void setCustomerService(BranchService branchService) {
		this.branchService = branchService;
	}

	@RequestMapping(value = "/addBranch", method = RequestMethod.GET)
	public ModelAndView showCreateBranchForm() {
		ModelAndView modelAndView = new ModelAndView("createBranch");
		modelAndView.addObject("headermessage", "Add branch Details");
		modelAndView.addObject("branch", new Branch());
		return modelAndView;
	}

	@RequestMapping(value = { "/addBranch", "updateBranch/addBranch" }, method = RequestMethod.POST)
	public ModelAndView addNewBranch(@ModelAttribute Branch branch, BindingResult bindingResult,
			HttpServletRequest request, HttpServletResponse response) {

		ModelAndView modelAndView = new ModelAndView("redirect:/addBranch");
		if (bindingResult.hasErrors()) {
			return new ModelAndView("error");
		}
		if (branch.getBranchId() == 0)

		{
			branchService.addBranch(branch);
		} else {
			branchService.updateBranch(branch);
		}
		return modelAndView;

	}

	@RequestMapping(value = "/listBranch", method = RequestMethod.GET)
	public String showListBranches(Model model, HttpServletRequest request, HttpServletResponse response) {

		List<Branch> list = branchService.getAllBranches();
		for (Branch branch : list) {
			System.out.println(branch.getName() + " " + branch.getBranchId());

		}
		model.addAttribute("list", list);
		return "listBranch";

	}

	@RequestMapping(value = "/updateBranch/{id}", method = RequestMethod.GET)
	public String updateBranch(@PathVariable("id") int id, Model model) {
		model.addAttribute("branch", this.branchService.getBranchById(id).orElse(null));

		return "createBranch";
	}


	@RequestMapping(value = "/deleteBranch/{id}", method = RequestMethod.GET)
	public String deleteBranch(@PathVariable("id") int id, Model model) {
		branchService.deleteBranch(branchService.getBranchById(id).orElse(null));
		List<Branch> list = branchService.getAllBranches();
		model.addAttribute("list", list);
		return "listBranch";
	}
}
