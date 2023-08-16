package com.my.library.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.my.library.dto.Student;
import com.my.library.service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	StudentService studentService;

	@GetMapping("/signup")
	public String gotoSignup()
	{
		return "Signup";
	}
	
	@GetMapping("/login")
	public String gotoLogin()
	{
		return "Login";
	}
	
	@PostMapping("/signup")
	public String signup(Student student,@RequestParam String date,@RequestParam MultipartFile pic,) throws IOException
	{
		return studentService.signup(student,date,pic);
	}
}
