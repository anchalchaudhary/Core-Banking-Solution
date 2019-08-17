package com.corebanking.spring.service;

import com.corebanking.spring.model.Branch;

public interface BranchService
{
    public boolean addBranch(Branch branch);
    public boolean deleteBranch(Branch branch);
    public boolean updateBranch(Branch branch);
}
