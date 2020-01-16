package az.developia.library.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import az.developia.library.model.Book;



public interface BookDAO extends JpaRepository<Book, Integer>{

	@Query(value="select * from book where name like %?1% and enabled=1 limit ?2,?3",nativeQuery=true)
	public List<Book> findAllSearch(String search,Integer begin,Integer length);
	@Query(value="select * from book where enabled=1 limit ?1,?2 ",nativeQuery=true)
	public List<Book> findPartial(Integer begin,Integer length);
	@Query(value="select * from book where enabled=1 and user_id=?1",nativeQuery=true)
	public List<Book> findEnabled(Integer userId);
	
}
