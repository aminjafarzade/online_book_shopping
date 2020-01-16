package az.developia.library.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import az.developia.library.dao.BookDAO;
import az.developia.library.dao.BookJdbcDAO;
import az.developia.library.model.Book;

@RestController
@CrossOrigin(origins="*")
@RequestMapping(path="/books")
public class BookController {
	
	@Autowired
	private BookDAO bookDAO;
	@Autowired
	private BookJdbcDAO jdbcDAO;
	@PostMapping
	public Integer add(@RequestBody Book p){
		return bookDAO.save(p).getId();
	}
	@GetMapping("/find-partial/{begin}/{length}")
	public List<Book> findPartial(@PathVariable(name="begin") Integer begin,@PathVariable(name="length") Integer length){
		return bookDAO.findPartial(begin,length);
	}
	@GetMapping("/find-all/{userId}")
	public List<Book> findAll(@PathVariable(name="userId") Integer userId){
		return bookDAO.findEnabled(userId);
	}
	
	@PutMapping(path="/updatebook")
	public void disabled(@RequestBody Integer id){
		jdbcDAO.disabled(id);
	}
	@GetMapping(path="/{id}")
	public Book findById(@PathVariable(name="id") Integer id){
		
		return bookDAO.findById(id).get();
	}
	@PutMapping
	public void update(@RequestBody Book b){
		bookDAO.save(b);
	}
	@GetMapping(path="/search/{search}/{begin}/{length}")
	public List<Book> getAllSearch(@PathVariable(name="search") String search,@PathVariable(name="begin") Integer begin,@PathVariable(name="length") Integer length){
		return bookDAO.findAllSearch(search,begin,length);
	}
	
	

}