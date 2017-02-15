package com.music.project;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface UserRepository extends JpaRepository<AppUser, Long> {

    @Query("SELECT u FROM AppUser u where u.login = :login")
    AppUser findByLogin(@Param("login") String login);

    @Query("SELECT u FROM AppUser u where u.email = :email")
    AppUser findUserByEmail(@Param("email") String email);

    @Query("SELECT u FROM AppUser u where u.resetPasswordToken = :resetPasswordToken")
    AppUser findByResetPasswordToken(@Param("resetPasswordToken") String resetPasswordToken);

    @Query("SELECT CASE WHEN COUNT(u) > 0 THEN true ELSE false END FROM AppUser u WHERE u.login = :login")
    boolean existsByLogin(@Param("login") String login);

    @Query("SELECT CASE WHEN COUNT(u) > 0 THEN true ELSE false END FROM AppUser u WHERE u.email = :email")
    boolean existsByEmail(@Param("email") String email);



}
