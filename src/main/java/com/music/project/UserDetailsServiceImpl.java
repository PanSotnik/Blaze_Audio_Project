package com.music.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.*;

import java.util.HashSet;
import java.util.Set;

public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserService userService;

    @Override
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
        AppUser appUser = userService.getUserByLogin(login);
        if (appUser == null)
            throw new UsernameNotFoundException(login + " not found");

        Set<GrantedAuthority> roles = new HashSet<>();
        roles.add(new SimpleGrantedAuthority(appUser.getRole().toString()));

        return new org.springframework.security.core.userdetails.User(appUser.getLogin(), appUser.getPassword(), roles);
    }







}
