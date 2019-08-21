package com.corebanking.spring.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.corebanking.spring.model.Employee;
@Repository
public interface SuperAdminRepository extends CrudRepository<Employee, Integer>{

}
