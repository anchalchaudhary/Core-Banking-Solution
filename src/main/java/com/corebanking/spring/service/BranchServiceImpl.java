package com.corebanking.spring.service;

import com.corebanking.spring.model.Branch;
import com.corebanking.spring.repository.BranchRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

@Service
public class BranchServiceImpl implements BranchService {

	private BranchRepository branchRepository;

	public BranchRepository getBranchRepository() {
		return branchRepository;
	}

	@Autowired
	public void setBranchRepository(BranchRepository branchRepository) {
		System.out.println("branch r object");
		this.branchRepository = branchRepository;
	}

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
		System.out.println(branchRepository);
		try {
			branchRepository.save(branch);
			return true;
		} catch (Exception ex) {
			return false;
		}
	}

	@Override
	@Transactional
	public boolean deleteBranch(Branch branch) {
		try {
			branchRepository.delete(branch);
			return true;
		} catch (Exception ex) {
			return false;
		}

	}

	@Override
	@Transactional
	public boolean updateBranch(Branch branch) {
		try {
			branchRepository.save(branch);
			return true;
		} catch (Exception ex) {
			return false;
		}
	}

	@Override
	@Transactional
	public List<Branch> getAllBranches() {
		System.out.println(branchRepository);
		List<Branch> list = new ArrayList<Branch>();
		branchRepository.findAll().forEach(e -> list.add(e));
		return list;
	}

	@Override
	@Transactional
	public Optional<Branch> getBranchById(int id) {
		// TODO Auto-generated method stub
		System.out.println(branchRepository);
		System.out.println(id);
		Optional<Branch> branch = branchRepository.findById(id);
		return branch;
	}
}
