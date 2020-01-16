package az.developia.library.dao;

import java.sql.Connection;
import java.sql.Statement;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
@Component
public class BookJdbcDAO {
	@Autowired
	private DataSource dataSource;
	public void disabled(Integer id){
		try{
			Connection c=dataSource.getConnection();
			Statement s=c.createStatement();
			s.execute("update book set enabled=0 where id="+id+"");
			s.close();
			c.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
