package com.my.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.library.helper.LoginHelper;
import com.my.library.service.LibrarianService;

@Controller
@RequestMapping("/librarian")
public class LibrarianController {

    @Autowired
    LibrarianService librarianService;

    @GetMapping
    public String defaultPage() {
        return "LibrarianDefault";
    }

    @PostMapping
    public String librarian(LoginHelper helper,ModelMap model)
    {
        return librarianService.librarianAccess(helper,model);
    }

}
