package com.my.library.helper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.my.library.dto.Student;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class SendMailLogic {

    @Autowired
    JavaMailSender mailSender;

    public void studentSignup(Student student) {
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage);

        try {
            helper.setFrom("LibraryManagement@gmail.com");
            helper.setSubject("Verification Link");
            helper.setTo(student.getEmail());
            String gender = "";
            if (student.getGender().equals("male"))
                gender = "Mr. ";
            else
                gender = "Ms. ";

            String message = "<h1>Hello " + gender + student.getName()
                    + ",<br>Your verification link to Creating Account with us is,<br><a href='https://solid-space-potato-qjvjppwg7x4hwg7-1234.app.github.dev/student/verify/"
                    + student.getId() + "/" + student.getToken() + "'>Click here</a></h1>";

            helper.setText(message, true);

            mailSender.send(mimeMessage);

        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }
}