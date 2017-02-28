package com.music.project;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class Application extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(Application.class);
    }

    @Bean
    public CommandLineRunner demo(final UserService userService) {
        return new CommandLineRunner() {
            @Override
            public void run(String... strings) throws Exception {
                if (!userService.existsByLogin("admin")){
                    userService.addUser(new AppUser("admin", "$2a$10$7PyZ4307aCG7kO138niB8uUhQ5rQQ4RyMKJrWAZSl/0kSYGSOcv3m", UserRole.ADMIN));
                }
            }
        };
    }
}
