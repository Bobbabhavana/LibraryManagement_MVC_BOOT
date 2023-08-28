package com.my.library.service;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import com.my.library.dao.BookDao;
import com.my.library.dao.BookRecordDao;
import com.my.library.dao.StudentDao;
import com.my.library.dto.Book;
import com.my.library.dto.BookRecord;
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
	BookRecordDao bookRecordDao;

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

	public String borrow(int id, HttpSession session, ModelMap map) {
		if (session.getAttribute("student") == null) {
			map.put("neg", "Invalid Session");
			return "Home";
		} else {
			Student student = (Student) session.getAttribute("student");
			Book book = bookDao.findById(id);

			boolean flag = true;
			// Logic to check if book is already borrowed by the student
			List<BookRecord> bookRecords = student.getRecords();
			if (bookRecords != null && !bookRecords.isEmpty()) {
				for (BookRecord bookRecord : bookRecords) {
					if (bookRecord.getBook().getId() == id && bookRecord.getReturnDate() == null) {
						flag = false;
						break;
					}
				}
			}
			// Logic for Checking previous Fine Payment Done
			double fine = 0;
			if (bookRecords != null && !bookRecords.isEmpty()) {
				for (BookRecord bookRecord : bookRecords) {
					fine = fine + bookRecord.getFine();
				}
			}

			if (fine > 0) {
				map.put("neg", "Fine Payment Pending Can not borrow New Book");
				return "StudentHome";
			} else {
				if (book.isStatus() && flag) {
					book.setQuantity(book.getQuantity() - 1);
					if (book.getQuantity() < 1)
						book.setStatus(false);
					// Mapping student and book with record
					BookRecord record = new BookRecord();
					record.setBook(book);
					record.setStudent(student);
					record.setIssueDate(LocalDate.now());

					bookRecordDao.saveRecord(record);

					// Mapping Record with book
					List<BookRecord> bookRecords1 = book.getRecords();

					if (bookRecords1 == null)
						bookRecords1 = new ArrayList<>();

					bookRecords1.add(record);
					book.setRecords(bookRecords1);

					bookDao.save(book);

					// Mapping Record with Student
					List<BookRecord> bookRecords2 = student.getRecords();
					if (bookRecords2 == null)
						bookRecords2 = new ArrayList<>();

					bookRecords2.add(record);
					student.setRecords(bookRecords2);

					studentDao.save(student);

					map.put("pos", "Book Borrowing Success");
					return "StudentHome";
				} else {
					map.put("neg", "Book is Not Available or Already borrowed");
					return "StudentHome";
				}
			}

		}
	}

}
