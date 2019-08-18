package com.corebanking.spring.controller;

import com.corebanking.spring.model.Branch;
import com.corebanking.spring.service.BranchService;
import com.corebanking.spring.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/branch")
public class BranchController
{
    private BranchService branchService;
    @Autowired(required=true)
    public void setCustomerService(BranchService branchService){
        this.branchService = branchService;
    }

}
