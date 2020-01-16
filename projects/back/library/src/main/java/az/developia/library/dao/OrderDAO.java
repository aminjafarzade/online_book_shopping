package az.developia.library.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import az.developia.library.model.OrderModel;


public interface OrderDAO extends JpaRepository<OrderModel, Integer> {
	@Query(value="select * from ordered_book s where s.note like %?1%",nativeQuery=true)
	public List<OrderModel> findAllSearch(String search);
	@Query(value="select * from ordered_book s where s.user_id = ?1",nativeQuery=true)
	public List<OrderModel> findAllById(Integer userId);
}