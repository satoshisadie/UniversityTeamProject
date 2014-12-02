package com.university.controllers.client.model;

/**
 * Created by T on 29.11.2014.
 */
public class ProfileSaveForm {
    private String firstName;
    private String lastName;
    private String info;
    private String educationalEstablishment;
    private String academicStatus;

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getEducationalEstablishment() {
        return educationalEstablishment;
    }

    public void setEducationalEstablishment(String educationalEstablishment) {
        this.educationalEstablishment = educationalEstablishment;
    }

    public String getAcademicStatus() {
        return academicStatus;
    }

    public void setAcademicStatus(String academicStatus) {
        this.academicStatus = academicStatus;
    }
}
