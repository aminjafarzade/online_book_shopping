package az.developia.library.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import az.developia.library.dao.OrderDAO;
import az.developia.library.model.OrderModel;


@RestController
@CrossOrigin(origins="*")
@RequestMapping(path="/orders")
public class OrderController {
	@Autowired
	private OrderDAO orderDAO;

	@PostMapping
	public Integer add(@RequestBody OrderModel o){
		return orderDAO.save(o).getId();
	}
	@GetMapping("/find")
	public List<OrderModel> findAll(){
		System.out.print(orderDAO.findAll());
		return orderDAO.findAllById();
	}
	

}
