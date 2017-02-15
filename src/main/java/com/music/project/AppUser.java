package com.music.project;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="Users")
public class AppUser {

    @Id
    @GeneratedValue
    private int id;

    private String login;
    private String password;
    private String email;

    @Enumerated(EnumType.STRING)
    private UserRole role;
    @Enumerated(EnumType.STRING)
    private UserGender gender;

    private String name;
    private int age;
    private String favoriteMusic;

    private String resetPasswordToken;
    private Date resetPasswordExpires;

    public AppUser(String login, String password, UserRole role) {
        this.login = login;
        this.password = password;
        this.role = role;
    }

    public AppUser(String login, String password, String email, UserRole role, UserGender gender, String name, int age, String favoriteMusic) {
        this.login = login;
        this.password = password;
        this.email = email;
        this.role = role;
        this.gender = gender;
        this.name = name;
        this.age = age;
        this.favoriteMusic = favoriteMusic;
    }

    public AppUser(String login, String password, String email, UserRole role, UserGender gender, String name, int age, String favoriteMusic, String resetPasswordToken, Date resetPasswordExpires) {
        this.login = login;
        this.password = password;
        this.email = email;
        this.role = role;
        this.gender = gender;
        this.name = name;
        this.age = age;
        this.favoriteMusic = favoriteMusic;
        this.resetPasswordToken = resetPasswordToken;
        this.resetPasswordExpires = resetPasswordExpires;
    }

    public AppUser() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public UserRole getRole() {
        return role;
    }

    public void setRole(UserRole role) {
        this.role = role;
    }

    public UserGender getGender() {
        return gender;
    }

    public void setGender(UserGender gender) {
        this.gender = gender;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getFavoriteMusic() {
        return favoriteMusic;
    }

    public void setFavoriteMusic(String favoriteMusic) { this.favoriteMusic = favoriteMusic; }

    public String getResetPasswordToken() {
        return resetPasswordToken;
    }

    public void setResetPasswordToken(String resetPasswordToken) {
        this.resetPasswordToken = resetPasswordToken;
    }

    public Date getResetPasswordExpires() {
        return resetPasswordExpires;
    }

    public void setResetPasswordExpires(Date resetPasswordExpires) {
        this.resetPasswordExpires = resetPasswordExpires;
    }
}
