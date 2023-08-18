package com.my.library.service;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.my.library.helper.LoginHelper;

@Service
public class LibrarianService {

    public String librarianAccess(LoginHelper helper, ModelMap model) {
        if(helper.getEmail().equals("jesm33@jsp.com") && helper.getPassword().equals("admin"))
        {
            model.put("pos", "Authorization Success");
            return "LibrarianMain";
        }
        else{
            model.put("neg", "Unauthorized You can not access");
            return "Home";
        }
    }
    
}
