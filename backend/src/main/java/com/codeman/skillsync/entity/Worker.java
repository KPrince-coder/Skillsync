package com.codeman.skillsync.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;


import java.util.List;


@Entity

public class Worker {
    public int getId() {
        return id;
    }

    public String getFullName() {
        return fullName;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getDescription() {
        return description;
    }

    public int getRating() {
        return rating;
    }

    public String getSkill() {
        return skill;
    }

    public List<String> getOtherSkills() {
        return otherSkills;
    }

    public String getLocation() {
        return location;
    }

    public double getExperience() {
        return experience;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }

    public void setOtherSkills(List<String> otherSkills) {
        this.otherSkills = otherSkills;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public void setExperience(double experience) {
        this.experience = experience;
    }

    //worker fields
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String fullName;
    private String email;
    private String password;
    private String phoneNumber;

    private String description;

    private int rating;

    private String skill;


    private List<String> otherSkills;

    //location
    private String location;

    private double experience;
    public  Worker() {
    }

    public Worker(int id, String fullName, String email, String password, String phoneNumber, String description, int rating, String skill, List<String> otherSkills, String location, double experience) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.description = description;
        this.rating = rating;
        this.skill = skill;
        this.otherSkills = otherSkills;
        this.location = location;
        this.experience = experience;
    }
}
