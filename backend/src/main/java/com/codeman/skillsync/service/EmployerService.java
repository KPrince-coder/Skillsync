package com.codeman.skillsync.service;

import com.codeman.skillsync.entity.Employer;
import com.codeman.skillsync.repository.EmployerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EmployerService {

    private final EmployerRepository employeeRepository;
    @Autowired
    public EmployerService(EmployerRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }

    public Employer saveEmployer(Employer employer) {
        // TODO implement
        employeeRepository.save(employer);
        return employer;
    }

    public Employer readEmployer(int id) {
        // TODO implement
        return employeeRepository.findById(id).orElse(null);
    }
}
