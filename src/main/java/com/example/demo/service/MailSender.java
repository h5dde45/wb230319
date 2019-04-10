package com.example.demo.service;

import com.example.demo.repos.EmailRepo;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailSender {
    private final JavaMailSender mailSender;
    private final EmailRepo emailRepo;

    public MailSender(JavaMailSender mailSender, EmailRepo emailRepo) {
        this.mailSender = mailSender;
        this.emailRepo = emailRepo;
    }


    public void send(String emailTo, String subject, String message) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();

        mailMessage.setFrom(emailRepo.findById(1).get().getUsername());
        mailMessage.setTo(emailTo);
        mailMessage.setSubject(subject);
        mailMessage.setText(message);

        mailSender.send(mailMessage);
    }
}
