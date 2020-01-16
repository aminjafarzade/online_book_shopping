package az.developia.library.model;

import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;



@Entity
@Table(name="book")
public class Book {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String name;
	private String description;
	private String image;
	private Integer pageCount;
	private Timestamp register;
	private Double price;
	private String author;
	private Byte enabled;
	private Integer userId;

	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Byte getEnabled() {
		return enabled;
	}
	public void setEnabled(Byte enabled) {
		this.enabled = enabled;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}

	
	
	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Integer getPageCount() {
		return pageCount;
	}
	public void setPageNumber(Integer pageCount) {
		this.pageCount = pageCount;
	}
	
	public Timestamp getRegister() {
		return register;
	}
	public void setRegister(Timestamp register) {
		this.register = register;
	}
}
