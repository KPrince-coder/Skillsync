package com.codeman.skillsync.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
@Entity
public class Task {
    //task details

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int taskId;

    public Task(String taskTitle, String taskDescription, String taskCategory, String taskStatus, int taskEmployerId, int taskWorkerId, int taskRatingId, String taskCreatedAt) {

        this.taskTitle = taskTitle;
        this.taskDescription = taskDescription;
        this.taskCategory = taskCategory;
        this.taskStatus = taskStatus;
        this.taskEmployerId = taskEmployerId;
        this.taskWorkerId = taskWorkerId;
        this.taskRatingId = taskRatingId;
        this.taskCreatedAt = taskCreatedAt;
    }

    public int getTaskId() {
        return taskId;
    }

    public String getTaskTitle() {
        return taskTitle;
    }

    public String getTaskDescription() {
        return taskDescription;
    }

    public String getTaskCategory() {
        return taskCategory;
    }

    public String getTaskStatus() {
        return taskStatus;
    }

    public int getTaskEmployerId() {
        return taskEmployerId;
    }

    public int getTaskWorkerId() {
        return taskWorkerId;
    }

    public int getTaskRatingId() {
        return taskRatingId;
    }

    public String getTaskCreatedAt() {
        return taskCreatedAt;
    }

    private String taskTitle;

    private String taskDescription;
    private String taskCategory;

    private String taskStatus;

    private int taskEmployerId;
    private int taskWorkerId;
    private int taskRatingId;

    private String taskCreatedAt;

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public void setTaskTitle(String taskTitle) {
        this.taskTitle = taskTitle;
    }

    public void setTaskDescription(String taskDescription) {
        this.taskDescription = taskDescription;
    }

    public void setTaskCategory(String taskCategory) {
        this.taskCategory = taskCategory;
    }

    public void setTaskStatus(String taskStatus) {
        this.taskStatus = taskStatus;
    }

    public void setTaskEmployerId(int taskEmployerId) {
        this.taskEmployerId = taskEmployerId;
    }

    public void setTaskWorkerId(int taskWorkerId) {
        this.taskWorkerId = taskWorkerId;
    }

    public void setTaskRatingId(int taskRatingId) {
        this.taskRatingId = taskRatingId;
    }

    public void setTaskCreatedAt(String taskCreatedAt) {
        this.taskCreatedAt = taskCreatedAt;
    }
}
