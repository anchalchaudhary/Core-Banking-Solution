package com.corebanking.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.corebanking.spring.model.SuperAdmin;

@Controller
public class SuperAdminController {

	HttpSession session;
	final String ADMIN_USERNAME = "superadmin";
	final String ADMIN_PASSWORD = "pw";

	ModelAndView mv;

	@RequestMapping("/super-admin-login")
	public String superAdminLogin(Model model) {
		model.addAttribute("superadmin", new SuperAdmin());
		return "super_admin_login";
//		mv = new ModelAndView();
//		mv.setViewName("super_admin_login");
//		((Object) mv).addAttribute("superadmin", new SuperAdmin());
//
//		return mv;
	}

	@SuppressWarnings("finally")
	@RequestMapping("/show-superadmin-dashboard")
	public ModelAndView showSuperAdminDashboard(@ModelAttribute("superadmin") SuperAdmin super_admin,
			BindingResult result, HttpServletRequest request, HttpServletResponse response) 
	{
		System.out.println("in super admin" + super_admin.getUsername() + "  " + super_admin.getPassword());
		mv = new ModelAndView();

		try {
			if (super_admin.getUsername().contentEquals(ADMIN_USERNAME)
					&& super_admin.getPassword().contentEquals(ADMIN_PASSWORD)) {
				session = request.getSession();
				session.setAttribute("username", super_admin.getUsername());
				System.out.println("Checkeddd");
				mv.setViewName("superadmin_dashboard");
				mv.addObject("display_name", super_admin.getUsername());
			} else {
				System.out.println("Unchecked");
				mv.setViewName("super-admin-login");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return mv;
		}
	}

	@RequestMapping("/superadmin-logout")
	public String superAdminLogout(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("in logout");
		session = request.getSession(false);
		
		session.invalidate();

		return "redirect:/super-admin-login";
		
	}

	@RequestMapping("/create_branch")
	public ModelAndView createBranch(HttpServletRequest request, HttpServletResponse response) {
		mv = new ModelAndView();
		mv.setViewName("create-branch");
		return mv;
	}

	@RequestMapping("/update_branch")
	public ModelAndView updateBranch(HttpServletRequest request, HttpServletResponse response) {
		mv = new ModelAndView();
		mv.setViewName("update-branch");
		return mv;
	}

	@RequestMapping("/delete_branch")
	public ModelAndView deleteBranch(HttpServletRequest request, HttpServletResponse response) {
		mv = new ModelAndView();
		mv.setViewName("delete-branch");
		return mv;
	}

}
