package com.codeman.skillsync.controller;

import com.codeman.skillsync.entity.Employer;
import com.codeman.skillsync.service.EmployerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController

public class EmployerController {
    private EmployerService employerService;

    @Autowired
    public EmployerController(EmployerService employerService) {
        System.out.println("EmployerController created!");
        this.employerService = employerService;
    }

    @PostMapping("/employer")
    public  Employer createEmployer(@RequestBody Employer employer){
        // save employer to database
        System.out.println(employer.getUsername());
        return employerService.saveEmployer(employer);
    }

    @GetMapping("/employer")
    public Employer readSingleEmployer(@RequestParam("id") int id) {
        // read employer from database
        return employerService.readEmployer(id);
    }
}
