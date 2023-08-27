package com.my.library.service;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import com.my.library.dao.BookDao;
import com.my.library.dao.StudentDao;
import com.my.library.dto.Book;
import com.my.library.dto.Student;
import com.my.library.helper.LoginHelper;
import com.my.library.helper.SendMailLogic;

import jakarta.servlet.http.HttpSession;

@Service
public class StudentService {

	@Autowired
	BCryptPasswordEncoder encoder;

	@Autowired
	StudentDao studentDao;

	@Autowired
	BookDao bookDao;

	@Autowired
	SendMailLogic mailLogic;

	public String signup(Student student, String date, MultipartFile pic, ModelMap model) throws IOException {
		if (studentDao.findByEmail(student.getEmail()) == null
				&& studentDao.findByMobile(student.getMobile()) == null) {
			student.setDob(LocalDate.parse(date));
			byte[] picture;
			picture = new byte[pic.getInputStream().available()];
			pic.getInputStream().read(picture);
			student.setPicture(picture);
			student.setPassword(encoder.encode(student.getPassword()));
			String[] tokenStrings = encoder.encode(LocalDate.now() + "").split("/");

			String token = tokenStrings[tokenStrings.length - 1];
			student.setToken(token);

			studentDao.save(student);
			mailLogic.studentSignup(student);

			model.put("pos", "Verification link sent success Click link to verify");
			return "Login";
		} else {
			model.put("neg", "Email and Mobile Should be Unique");
			return "Signup";
		}
	}

	public String createStudentAccount(int id, String token, ModelMap model) {
		Student student = studentDao.findById(id);
		if (student == null) {
			model.put("neg", "Something went wrong");
			return "Login";
		}
		if (student.getToken().equals(token)) {
			student.setStatus(true);
			studentDao.save(student);
			model.put("pos", "Account verified Success, You can Login now");
			return "Login";
		} else {
			model.put("neg", "Invalid link");
			return "Home";
		}
	}

	public String login(LoginHelper helper, ModelMap model, HttpSession session) {
		Student student = studentDao.findByEmail(helper.getEmail());
		if (student == null) {
			model.put("neg", "Invalid Email Check and Try Again");
			return "Login";
		} else {
			if (encoder.matches(helper.getPassword(), student.getPassword())) {
				if (student.isStatus()) {
					model.put("pos", "Login Success");
					session.setAttribute("student", student);
					session.setMaxInactiveInterval(120);
					return "StudentHome";
				} else {
					model.put("neg", "Verify your Email First");
					return "Login";
				}
			} else {
				model.put("neg", "Invalid Password");
				return "Login";
			}
		}
	}

	public String fetchBooks(HttpSession session, ModelMap model) {
		if (session.getAttribute("student") == null) {
			model.put("neg", "Invalid Session");
			return "Home";
		} else {
			List<Book> books = bookDao.findAll();
			if (books.isEmpty()) {
				model.put("neg", "No Books Found");
				return "StudentHome";
			} else {
				model.put("books", books);
				return "StudentBooks";
			}
		}
	}

	public String fetchBooks(String name, ModelMap model, HttpSession session) {
		if (session.getAttribute("student") == null) {
			model.put("neg", "Invalid Session");
			return "Home";
		} else {
			if (name.equals("")) {
				return fetchBooks(session, model);
			} else {
				List<Book> books = bookDao.findByName(name);
				if (books.isEmpty())
					books = bookDao.findByAuthor(name);

				if (books.isEmpty())
					model.put("neg", "Book Not Found");

				model.put("books", books);
				return "StudentBooks";
			}
		}
	}

	public String edit(HttpSession session, ModelMap model) {
		if (session.getAttribute("student") == null) {
			model.put("neg", "Invalid Session");
			return "Home";
		} else {
			Student student = (Student) session.getAttribute("student");
			model.put("student", student);
			return "EditStudent";
		}
	}

	public String update(Student student, String date, ModelMap model, HttpSession session) {
		if (session.getAttribute("student") == null) {
			model.put("neg", "Invalid Session");
			return "Home";
		} else {
			Student student2 = (Student) session.getAttribute("student");
			student.setDob(LocalDate.parse(date));
			student.setPassword(encoder.encode(student.getPassword()));
			student.setPicture(student2.getPicture());
			student.setStatus(true);
			student.setToken(student2.getToken());
			studentDao.save(student);
			model.put("pos", "Updated Successfully");
			return "StudentHome";
		}
	}

}
