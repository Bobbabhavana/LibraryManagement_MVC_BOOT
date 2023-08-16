package com.my.library.service;

import java.io.IOException;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.my.library.dto.Student;

@Service
public class StudentService {

	@Autowired
	BCryptPasswordEncoder encoder;

	public String signup(Student student, String date, MultipartFile pic) throws IOException {
		student.setDob(LocalDate.parse(date));
		byte[] picture;
			picture = new byte[pic.getInputStream().available()];
			pic.getInputStream().read(picture);
		student.setPicture(picture);
		student.setPassword(encoder.encode(student.getPassword()));
		
		
		
		
		
	}

}
