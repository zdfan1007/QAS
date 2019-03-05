package com.bysj.pojo;

public class User {
    private Integer id;

    private String username;

    private String password;

    private String mail;

    private Integer state;

    private String acticode;

    private String tokenExptime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail == null ? null : mail.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getActicode() {
        return acticode;
    }

    public void setActicode(String acticode) {
        this.acticode = acticode == null ? null : acticode.trim();
    }

    public String getTokenExptime() {
        return tokenExptime;
    }

    public void setTokenExptime(String tokenExptime) {
        this.tokenExptime = tokenExptime == null ? null : tokenExptime.trim();
    }
}