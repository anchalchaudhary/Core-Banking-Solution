package com.corebanking.spring.service;

import com.corebanking.spring.model.Branch;
import com.corebanking.spring.model.Customer;
import com.corebanking.spring.repository.BranchRepository;
import com.corebanking.spring.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

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
    @Override
    @Transactional
	public List<Branch> getAllBranches()
    {

		List<Branch> list = new ArrayList<Branch>();
		branchRepository.findAll().forEach(e -> list.add(e));
		return list;
	}

	@Override
	public Optional<Branch> getBranchById(int id) {
		// TODO Auto-generated method stub
		 Optional<Branch> branch=branchRepository.findById(id);
		return branch;
	}
}
