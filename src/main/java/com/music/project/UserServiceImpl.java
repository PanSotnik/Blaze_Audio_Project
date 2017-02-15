package com.music.project;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public void addUser(AppUser appUser) {
        userRepository.save(appUser);
    }

    @Override
    public void updateUser(AppUser appUser) {
        userRepository.save(appUser);
    }

    @Override
    @Transactional(readOnly = true)
    public boolean existsByLogin(String login) {
        return userRepository.existsByLogin(login);
    }

    @Override
    @Transactional(readOnly = true)
    public boolean existsByEmail(String email) { return userRepository.existsByEmail(email); }

    @Override
    @Transactional(readOnly = true)
    public AppUser getUserByLogin(String login) {
        return userRepository.findByLogin(login);
    }

    @Override
    @Transactional(readOnly = true)
    public AppUser findUserByEmail(String email) {
        return userRepository.findUserByEmail(email);
    }

    @Override
    @Transactional
    public AppUser findByResetPasswordToken(String resetPasswordToken) { return userRepository.findByResetPasswordToken(resetPasswordToken); }




}
