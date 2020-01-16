import { Component, OnInit } from '@angular/core';
import { OrderModel } from 'src/app/model/order';
import { BasketBook } from 'src/app/model/basket';
import { OrderService } from 'src/app/service/order.service';
import { Router } from '@angular/router';
import { BasketService } from 'src/app/service/basket.service';

@Component({
  selector: 'app-order-page',
  templateUrl: './order-page.component.html',
  styleUrls: ['./order-page.component.css']
})
export class OrderPageComponent implements OnInit {

  constructor(private basketService: BasketService,private orderService:OrderService,private router:Router) { }
  basketBooks: BasketBook[] = [];
  confirm: boolean = false;
  order: OrderModel = new OrderModel(0);


  ngOnInit() {
    this.basketBooks = this.basketService.basketBooks;
    this.order.basketBooks = this.basketBooks;
    let totalPrice = 0;
    
    for (let index = 0; index < this.order.basketBooks.length; index++) {
      const o = this.order.basketBooks[index];

      totalPrice += o.count * o.book.price;
    }
    this.order.totalPrice = totalPrice;
  }
  saveOrder() {

    this.orderService.addOrder(this.order).subscribe(
      resp=>{
        alert('Uğurlu Sifariş');
        this.router.navigate(["selling-books"]);
        this.basketService.basketBooks=[];
      }
    );


  }

}
