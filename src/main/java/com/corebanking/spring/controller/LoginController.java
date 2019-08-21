package com.corebanking.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.corebanking.spring.model.Employee;
import com.corebanking.spring.service.EmployeeService;

@Controller
public class LoginController
{
	@Autowired
	private EmployeeService employeeService;
	
	UsernamePasswordAuthenticationToken authReq;
	Authentication auth;
	SecurityContext sc;
	AuthenticationManager authManager;

	@RequestMapping(value="/login",method = RequestMethod.GET)
	public String showLoginForm(Model model)
	{
		model.addAttribute("employee", new Employee());
		return "login";
	}
	
	@RequestMapping(value="/login",method = RequestMethod.POST)
    public ModelAndView login(@ModelAttribute Employee employee,HttpServletRequest request)
	{ 

        Employee loggedinUser = new Employee();
        loggedinUser=employeeService.findEmployeeByUsername(employee.getEmpUserName());
        String passwordSha256Hex = employee.getEmpPassword();        
        boolean isMatched=false;
        if(loggedinUser!=null && loggedinUser.getEmpPassword().equals(passwordSha256Hex))
        	isMatched=true;
        if(isMatched) {
            HttpSession session = request.getSession();
            session.setAttribute("username", employee.getEmpUserName());   
            session.setAttribute("employee", "employeeSession");
             authReq= new UsernamePasswordAuthenticationToken(employee.getEmpUserName(), employee.getEmpPassword());
             auth = authManager.authenticate(authReq);           
	         SecurityContext sc = SecurityContextHolder.getContext();
	         sc.setAuthentication(auth);
            return new ModelAndView("redirect:/home"); 
        }
        else {
            System.out.println("credentials not matched");
            ModelAndView modelAndView=new ModelAndView();
            modelAndView.addObject("employee", employee);
            modelAndView.setViewName("login");
            return modelAndView; 
        }

    }   

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response)
	{
		System.out.println("in logout");
		HttpSession session;
		session = request.getSession(false);
		
		session.invalidate();

		return "redirect:/login";
		
	}
}
