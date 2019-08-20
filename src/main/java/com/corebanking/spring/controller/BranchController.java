package com.corebanking.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.corebanking.spring.service.BranchService;

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
