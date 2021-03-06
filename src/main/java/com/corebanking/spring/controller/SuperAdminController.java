package com.corebanking.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.corebanking.spring.model.Branch;
import com.corebanking.spring.model.Employee;
import com.corebanking.spring.model.SuperAdmin;
import com.corebanking.spring.service.SuperAdminService;
@Controller
public class SuperAdminController {

	@Autowired
	private SuperAdminService adminService;

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
	
	@RequestMapping("show-superadmin-dashboard")
	public ModelAndView showSuperAdminDashBoard1(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("in dashboard1");
		mv = new ModelAndView();
		mv.setViewName("superadmin_dashboard");
		return mv;
	}

	@SuppressWarnings("finally")
	@RequestMapping("/authenticate")
	public ModelAndView showSuperAdminDashboard(@ModelAttribute("superadmin") SuperAdmin super_admin,
			BindingResult result, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("in super admin" + super_admin.getUsername() + "  " + super_admin.getPassword());
		mv = new ModelAndView();

		try {
			if (super_admin.getUsername().contentEquals(ADMIN_USERNAME)
					&& super_admin.getPassword().contentEquals(ADMIN_PASSWORD)) {
				session = request.getSession();
				session.setAttribute("username", super_admin.getUsername());
				System.out.println("Checkeddd");
				mv.setViewName("redirect:/show-superadmin-dashboard");
			} else {
				System.out.println("Unchecked");
				mv.setViewName("super_admin_login");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return mv;
		}
	}
	
	@RequestMapping("/sure-logout")
	public ModelAndView sureLogout(HttpServletRequest request, HttpServletResponse response)
	{
		System.out.println("in sure logout");
		mv = new ModelAndView();
		mv.setViewName("sure_logout");
		return mv;
	}

	@RequestMapping("/superadmin-logout")
	public String superAdminLogout(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("in logout");
		session = request.getSession(false);

		session.invalidate();

		return "redirect:/super-admin-login";

	}

	@RequestMapping(value = "/add_employee", method = RequestMethod.GET)
	public ModelAndView showCreateBranchForm(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView modelAndView = new ModelAndView("create-employee");
		modelAndView.addObject("headermessage", "Add branch Details");
		modelAndView.addObject("employee", new Employee());
		return modelAndView;
	}

	@RequestMapping(value = { "/add_employee", "/update_employee/add_employee" }, method = RequestMethod.POST)
	public ModelAndView addEmployee(@ModelAttribute Employee employee, BindingResult bindingResult,
			HttpServletRequest request, HttpServletResponse response) {
		mv = new ModelAndView("redirect:/list_employee");
		if (bindingResult.hasErrors()) {
			return new ModelAndView("error");
		}
		if (employee.getEmpId() == 0) {
			adminService.saveEmployee(employee);
		} else {
			adminService.updateEmployee(employee);
		}

		return mv;
	}

	@RequestMapping(value = "/update_employee/{id}", method = RequestMethod.GET)
	public String updateBranch(@PathVariable("id") int id, Model model) {
		model.addAttribute("employee", this.adminService.getEmployeeById(id).orElse(null));
		model.addAttribute("headermessage", "Update Employee Details");

		return "create-employee";
	}

	@RequestMapping(value = "/delete_employee/{id}", method = RequestMethod.GET)
	public String deleteBranch(@PathVariable("id") int id, Model model) {
		adminService.deleteEmployee(adminService.getEmployeeById(id).orElse(null));
		List<Employee> list = adminService.listEmployee();
		model.addAttribute("list", list);
		return "redirect:/list_employee";
	}

	@RequestMapping("/list_employee")
	public ModelAndView listEmployees(HttpServletRequest request, HttpServletResponse response) {
		List<Employee> list;

		mv = new ModelAndView();
		mv.setViewName("list-employee");
		System.out.println(adminService);
		list = adminService.listEmployee();

		for(Employee e: list)
		{
			System.out.println(e);
		}
		mv.addObject("list", list);
		return mv;
	}
}
		
