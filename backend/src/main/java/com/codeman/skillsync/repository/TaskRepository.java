package com.codeman.skillsync.repository;

import com.codeman.skillsync.entity.Task;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TaskRepository extends JpaRepository<Task, Integer> {
}
