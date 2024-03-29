import { Component, OnInit } from '@angular/core';
import { OrderModel } from 'src/app/model/order';
import { BasketBook } from 'src/app/model/basket';
import { OrderService } from 'src/app/service/order.service';
import { Router } from '@angular/router';
import { BasketService } from 'src/app/service/basket.service';
import { UserService } from 'src/app/service/user.service';

@Component({
  selector: 'app-order-page',
  templateUrl: './order-page.component.html',
  styleUrls: ['./order-page.component.css']
})
export class OrderPageComponent implements OnInit {

  constructor(private basketService: BasketService,private orderService:OrderService,private router:Router,private userService:UserService) { }
  basketBooks: BasketBook[] = [];
  confirm: boolean = false;
  order: OrderModel = new OrderModel(0);


  ngOnInit() {
    if(this.basketService.basketBooks.length>0){//sifaris ucun kitab olub olmadigini arasdirir ve eger varsa onlarin umumi qiymetlerini tapir
      this.basketBooks = this.basketService.basketBooks;
      this.order.basketBooks = this.basketBooks;
      let totalPrice = 0;
      
      for (let index = 0; index < this.order.basketBooks.length; index++) {
        const o = this.order.basketBooks[index];
  
        totalPrice += o.count * o.book.price;
      }
      this.order.totalPrice = totalPrice;
    }else{
      this.router.navigate(["selling-book"]);
    }
    
  }
  ordered:boolean=false;
  saveOrder() {//sifarisi yadda saxlayir


    this.orderService.addOrder(this.order).subscribe(
      resp=>{
        alert('Uğurlu Sifariş');
        this.router.navigate(["selling-books"]);
        this.basketService.basketBooks=[];
      }
    );


  }

}
