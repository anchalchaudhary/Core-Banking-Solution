package com.corebanking.spring.service;

import java.util.List;
import java.util.Optional;

import com.corebanking.spring.model.Branch;

public interface BranchService
{
    public boolean addBranch(Branch branch);
    public boolean deleteBranch(Branch branch);
    public boolean updateBranch(Branch branch);
    public List<Branch> getAllBranches();
    public Optional<Branch> getBranchById(int id);
}
