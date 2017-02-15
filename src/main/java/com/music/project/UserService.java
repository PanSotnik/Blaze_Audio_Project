package com.music.project;

public interface UserService {

    void addUser(AppUser appUser);
    void updateUser(AppUser appUser);
    boolean existsByLogin(String login);
    boolean existsByEmail(String email);
    AppUser getUserByLogin(String login);
    AppUser findUserByEmail(String email);
    AppUser findByResetPasswordToken(String resetPasswordToken);

}
