import { Component, OnInit } from '@angular/core';
import { OrderModel } from 'src/app/model/order';
import { OrderService } from 'src/app/service/order.service';
import { Subject } from 'rxjs';
import { UserService } from 'src/app/service/user.service';
import { Router } from '@angular/router';
import { BasketBook } from 'src/app/model/basket';

@Component({
  selector: 'app-ordered-book',
  templateUrl: './ordered-book.component.html',
  styleUrls: ['./ordered-book.component.css']
})
export class OrderedBookComponent implements OnInit {


  orders: OrderModel[] = [];
  constructor(private orderService: OrderService, private userService: UserService, private router: Router) { }
  dtOptions: DataTables.Settings = {};
  dtTrigger: Subject<OrderModel> = new Subject();
  ordersForUserId: OrderModel[] = [];


  ngOnInit() {
    if (this.userService.getUsername() === '') {
      this.router.navigate(['selling-book']);
    } else {
      this.dtOptions = {
        pagingType: 'full_numbers',
        pageLength: 10,
        processing: true
      };

      this.orderService.findAll().subscribe(
        resp => {
          this.orders = resp;
          
          for (let index = 0; index < this.orders.length; index++) {
           
            const o = this.orders[index];
            let orderForUserId=new OrderModel(0);
            let totalPrice:number=0;
            for (let j = 0; j < o.basketBooks.length; j++) {
              const b = o.basketBooks[j];
              let basketBook=new BasketBook(0);
           

              
              if (b.book.userId === this.userService.userId) {
                orderForUserId.customer = o.customer;
                orderForUserId.id = o.id;
                orderForUserId.note = o.note;
                orderForUserId.register = o.register;
                
                totalPrice+= b.count*b.book.price;
                if(orderForUserId.basketBooks.includes(b)){

                }else{
                  orderForUserId.basketBooks.push(b);
                }
              }
              orderForUserId.totalPrice=totalPrice;
              

            }
            if(orderForUserId.id===0){

            }else{
              this.ordersForUserId.push(orderForUserId);
            }
            
            

          }
          
  
          this.dtTrigger.next();
        }
      );
    }
  }
  ngOnDestroy(): void {
    this.dtTrigger.unsubscribe();
  }



}
