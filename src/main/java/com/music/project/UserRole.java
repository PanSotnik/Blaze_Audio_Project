package com.music.project;


public enum UserRole {

    ADMIN, USER;

    @Override
    public String toString() {
        return "ROLE_" + name();
    }

}
