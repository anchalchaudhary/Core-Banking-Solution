package com.corebanking.spring.service;

import java.util.List;

import com.corebanking.spring.model.Employee;

public interface SuperAdminService {
	
	boolean saveEmployee(Employee employee);
	boolean updateEmployee(Employee employee);
	boolean deleteEmployee(Employee employee);
	List<Employee> listEmployee();
}
