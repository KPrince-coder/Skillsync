package com.codeman.skillsync.controller;

import com.codeman.skillsync.entity.Worker;
import com.codeman.skillsync.repository.WorkerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class WorkerController {

    WorkerRepository workerRepository;

    @Autowired
    public WorkerController(WorkerRepository workerRepository){
        System.out.println("WorkerController created!");
        this.workerRepository = workerRepository;

    }

    @GetMapping("/worker")
    public Worker readSingleWorker(@RequestParam int id) {
        // read worker from database
        Worker worker = workerRepository.findById(id).orElse(null);
        return worker;
    }

    @PostMapping("/worker")
    public Worker createWorker(@RequestParam Worker worker){
        // save worker to database
        System.out.println(worker.toString());
        workerRepository.save(worker);
        return worker;
    }
}
