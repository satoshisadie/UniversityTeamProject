package com.university.controllers.client.model;

import java.util.Date;

public class Teacher {
    private String email;
    private String login;
    private String password;
    private String photo;
    private String info;
    private String educationalEstablishment;
    private String academicStatus;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
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
