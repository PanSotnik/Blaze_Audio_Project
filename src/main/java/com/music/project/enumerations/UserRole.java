package com.music.project.enumerations;


public enum UserRole {

    ADMIN, USER;

    @Override
    public String toString() {
        return "ROLE_" + name();
    }

}
