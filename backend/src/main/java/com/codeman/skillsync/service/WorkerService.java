package com.codeman.skillsync.service;


import com.codeman.skillsync.entity.Worker;
import com.codeman.skillsync.repository.WorkerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;
import java.time.DayOfWeek;

import java.time.LocalDate;

@Service
public class WorkerService {

    private final WorkerRepository workerRepository;

    @Autowired
    public WorkerService(WorkerRepository workerRepository) {
        this.workerRepository = workerRepository;
    }

//    public Worker findWorkerOfTheWeek() {
//        LocalDate now = LocalDate.now();
//        LocalDate startOfWeek = now.with(DayOfWeek.MONDAY);
//        LocalDate endOfWeek = now.with(DayOfWeek.SUNDAY);
//
//        return workerRepository.findTopByWorkDateBetweenOrderByWorkDoneDesc(startOfWeek, endOfWeek);
//    }

}
