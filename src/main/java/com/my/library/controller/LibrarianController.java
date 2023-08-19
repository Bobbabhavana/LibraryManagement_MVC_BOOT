package com.my.library.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.my.library.dto.Librarian;
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

    @GetMapping("/main")
    public String mainPage() {
        return "LibrarianMain";
    }

    @PostMapping
    public String librarian(LoginHelper helper, ModelMap model) {
        return librarianService.librarianAccess(helper, model);
    }

    @GetMapping("/signup")
    public String loadSignup() {
        return "LibrarianSignup";
    }

    @PostMapping("/signup")
	public String createLibrarianAccount(Librarian librarian,ModelMap model) {
		return librarianService.createLibrarianAccount(librarian,model);
	}

    @PostMapping("/signup/{id}")
	public String createLibrarianAccount(@PathVariable int id,@RequestParam int otp,ModelMap model) {
		return librarianService.createLibrarianAccount(id,otp,model);
	}

}
