package com.corebanking.spring.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.corebanking.spring.model.Branch;
import com.corebanking.spring.model.Employee;
import com.corebanking.spring.repository.EmployeeRepository;

@Service
public class SuperAdminImpl implements SuperAdminService {

	private EmployeeRepository emploRepository;

	public EmployeeRepository getEmploRepository() {
		return emploRepository;
	}

	@Autowired
	public void setEmploRepository(EmployeeRepository emploRepository) {
		System.out.println("Hey There");
		this.emploRepository = emploRepository;
	}

	@Override
	@Transactional
	public boolean saveEmployee(Employee employee) {

		try {
			emploRepository.save(employee);
			return true;
		} catch (Exception ex) {
			return false;
		}
		// TODO Auto-generated method stub

	}

	@Override
	@Transactional
	public boolean updateEmployee(Employee employee) {
		// TODO Auto-generated method stub
		try {
			emploRepository.save(employee);
			return true;
		} catch (Exception ex) {
			return false;
		}

	}

	@Override
	@Transactional
	public boolean deleteEmployee(Employee employee) {
		// TODO Auto-generated method stub
		try {
			emploRepository.delete(employee);
			return true;
		} catch (Exception ex) {
			return false;
		}

	}

	@Override
	@Transactional
	public List<Employee> listEmployee() {
		System.out.println("Employee Repo:"+emploRepository);
		List<Employee> list = new ArrayList<Employee>();
		emploRepository.findAll().forEach(e -> list.add(e));		
		if (list != null) {
			System.out.println("not null");
		}
		return list;
	}

	@Override
	public Optional<Employee> getEmployeeById(int id) {
		Optional<Employee> employee = emploRepository.findById(id);
		return employee;
	}
	

}
