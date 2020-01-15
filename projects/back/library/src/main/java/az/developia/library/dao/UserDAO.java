package az.developia.library.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import az.developia.library.model.UserInfo;

public interface UserDAO extends JpaRepository<UserInfo, Integer>{

}
