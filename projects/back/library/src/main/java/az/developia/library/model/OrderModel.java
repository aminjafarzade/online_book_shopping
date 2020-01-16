package az.developia.library.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="ordered_book")
public class OrderModel {
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public List<BasketBook> getBasketBooks() {
		return basketBooks;
	}
	public void setBasketBooks(List<BasketBook> basketBooks) {
		this.basketBooks = basketBooks;
	}
	public Double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="customer_id")
	@JsonIgnoreProperties(value={"orders"})
	public Customer customer;
	
	public String note;
	
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="order_id")
	public List<BasketBook> basketBooks;
	
	@Override
	public String toString() {
		return "OrderModel [id=" + id + ", customer=" + customer + ", note=" + note + ", basketBooks=" + basketBooks
				+ ", totalPrice=" + totalPrice + ", register=" + register + "]";
	}
	public Double totalPrice;
	public Timestamp register;

}
