package az.developia.library.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import az.developia.library.dao.UserDAO;
import az.developia.library.model.UserInfo;

@RestController
@CrossOrigin(origins="*")
@RequestMapping(path="/users")
public class UserController {
	@Autowired
	private UserDAO userDAO;
	
	@GetMapping
	public List<UserInfo> findAll(){
		return userDAO.findAll();
		
	}
	@PostMapping
	public Integer addUser(@RequestBody UserInfo user){
		return userDAO.save(user).getId();
		
	}


}

