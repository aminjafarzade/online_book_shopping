import { Component, OnInit } from '@angular/core';
import { OrderModel } from 'src/app/model/order';
import { OrderService } from 'src/app/service/order.service';
import { Subject } from 'rxjs';
import { UserService } from 'src/app/service/user.service';

@Component({
  selector: 'app-ordered-book',
  templateUrl: './ordered-book.component.html',
  styleUrls: ['./ordered-book.component.css']
})
export class OrderedBookComponent implements OnInit {


  orders: OrderModel[] = [];
  constructor(private orderService: OrderService,private userService:UserService) { }
  dtOptions: DataTables.Settings = {};
  dtTrigger: Subject<OrderModel> = new Subject();


  ngOnInit() {
    this.dtOptions = {
      pagingType: 'full_numbers',
      pageLength: 10,
      processing: true
    };

    this.orderService.findAll(this.userService.userId).subscribe(
      resp => {
        this.orders = resp;
        this.dtTrigger.next();
      }
    );
  }
  ngOnDestroy(): void {
    this.dtTrigger.unsubscribe();
  }



}
