package com.codeman.skillsync.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Rating {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int ratingId;

    public Rating(double rating, String comment, int workerId, int employerId, int taskId) {
        this.rating = rating;
        this.comment = comment;
        this.workerId = workerId;
        this.employerId = employerId;
        this.taskId = taskId;
    }

    public Rating() {
    }

    public int getRatingId() {
        return ratingId;
    }

    public double getRating() {
        return rating;
    }

    public String getComment() {
        return comment;
    }

    public int getWorkerId() {
        return workerId;
    }

    public int getEmployerId() {
        return employerId;
    }

    public int getTaskId() {
        return taskId;
    }

    private double rating;

    public void setRatingId(int ratingId) {
        this.ratingId = ratingId;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void setWorkerId(int workerId) {
        this.workerId = workerId;
    }

    public void setEmployerId(int employerId) {
        this.employerId = employerId;
    }

    public void setJobId(int taskId) {
        this.taskId = taskId;
    }

    private String comment;
    private int workerId;
    private int employerId;
    private int taskId;

}
