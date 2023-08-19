package com.my.library.service;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.my.library.dao.LibrarianDao;
import com.my.library.dto.Librarian;
import com.my.library.helper.LoginHelper;
import com.my.library.helper.SendMailLogic;

@Service
public class LibrarianService {

    @Autowired
    LibrarianDao librarianDao;

    @Autowired
    SendMailLogic mailLogic;

    public String librarianAccess(LoginHelper helper, ModelMap model) {
        if (helper.getEmail().equals("jesm33@jsp.com") && helper.getPassword().equals("admin")) {
            model.put("pos", "Authorization Success");
            return "LibrarianMain";
        } else {
            model.put("neg", "Unauthorized You can not access");
            return "Home";
        }
    }

    public String createLibrarianAccount(Librarian librarian, ModelMap model) {
        int otp = new Random().nextInt(100000, 999999);
        librarian.setOtp(otp);

        Librarian librarian2 = librarianDao.fetchByEmail(librarian.getEmail());

        if (librarian2 == null) {
            librarianDao.save(librarian);

            mailLogic.librarianSignupMail(librarian);
            model.put("pos", "Otp Sent Success");
            model.put("id", librarian.getId());
            return "VerifyOtp";
        } else {
            model.put("neg", "Email Should not be Repeated");
            return "LibrarianSignup";
        }
    }

    public String createLibrarianAccount(int id, int otp, ModelMap model) {
        Librarian librarian = librarianDao.findById(id);
        if (librarian == null) {
            model.put("neg", "Something Went Wrong");
            return "LibrarianSignup";
        } else {
            if (librarian.getOtp() == otp) {
                librarian.setStatus(true);
                librarianDao.save(librarian);
                model.put("pos", "Account Created Successfully");
                return "LibrarianLogin";

            } else {
                model.put("neg", "OTP MissMatch");
                model.put("id", librarian.getId());
                return "VerifyOtp";
            }
        }
    }

}
