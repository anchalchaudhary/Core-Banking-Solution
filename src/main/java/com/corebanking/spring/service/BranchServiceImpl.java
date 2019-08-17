package com.corebanking.spring.service;

import com.corebanking.spring.model.Branch;
import com.corebanking.spring.repository.BranchRepository;
import com.corebanking.spring.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class BranchServiceImpl implements  BranchService
{
    private BranchRepository branchRepository;
    public BranchServiceImpl() {

    }

    @Autowired
    public BranchServiceImpl(BranchRepository branchRepository) {
        super();
        this.branchRepository = branchRepository;
    }
    @Override
    @Transactional
    public boolean addBranch(Branch branch) {
        try {
            branchRepository.save(branch);
            return true;
        }catch(Exception ex) {
            return false;
        }
    }

    @Override
    @Transactional
    public boolean deleteBranch(Branch branch) {
        try {
            branchRepository.delete(branch);
            return true;
        }catch(Exception ex) {
            return false;
        }

    }

    @Override
    @Transactional
    public boolean updateBranch(Branch branch) {
        try {
            branchRepository.save(branch);
            return true;
        }catch(Exception ex) {
            return false;
        }
    }
}
