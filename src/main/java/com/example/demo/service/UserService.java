package com.example.demo.service;

import com.example.demo.domain.Role;
import com.example.demo.domain.TempUser;
import com.example.demo.domain.User;
import com.example.demo.repos.TempUserRepo;
import com.example.demo.repos.UserRepo;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Collections;
import java.util.UUID;

@Service
public class UserService implements UserDetailsService {
    private final UserRepo userRepo;
    private final TempUserRepo tempUserRepo;
    private final MailSender mailSender;

    public UserService(UserRepo userRepo, TempUserRepo tempUserRepo, MailSender mailSender) {
        this.userRepo = userRepo;
        this.tempUserRepo = tempUserRepo;
        this.mailSender = mailSender;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepo.findByUsername(username);
    }

    public boolean addUser(TempUser tempUser) {
        User userFromDb = userRepo.findByUsername(tempUser.getUsername());

        if (userFromDb != null) {
            return false;
        }
        tempUser.setActivationCode(UUID.randomUUID().toString());

        tempUserRepo.save(tempUser);
        if (!StringUtils.isEmpty(tempUser.getEmail())) {
            String message = String.format(" Hi, %s \n" +
                            "Follow this link: http://localhost:8080/activate/%s",
                    tempUser.getUsername(), tempUser.getActivationCode());
            mailSender.send(tempUser.getEmail(), "ActivationCode", message);
        }
        return true;
    }

    public boolean activateUser(String code) {
        TempUser tempUser = tempUserRepo.findByActivationCode(code);

        if (tempUser == null) {
            return false;
        }

        tempUserRepo.delete(tempUser);
        User user = new User();
        user.setUsername(tempUser.getUsername());
        user.setPassword(tempUser.getPassword());
        user.setEmail(tempUser.getEmail());
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        userRepo.save(user);

        return true;
    }
}
