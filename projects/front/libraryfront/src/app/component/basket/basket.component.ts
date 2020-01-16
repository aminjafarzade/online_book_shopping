import { Component, OnInit } from '@angular/core';
import { API_URL } from 'src/app/constants';
import { BasketService } from 'src/app/service/basket.service';
import { Router } from '@angular/router';
import { BasketBook } from 'src/app/model/basket';

@Component({
  selector: 'app-basket',
  templateUrl: './basket.component.html',
  styleUrls: ['./basket.component.css']
})
export class BasketComponent implements OnInit {

  basketBooks: BasketBook[] = []
  constructor(private basketService: BasketService,private router:Router) { }
  downloadPath: string;

  ngOnInit() {
    this.downloadPath = API_URL + '/filedownload/files/';
    this.basketBooks = this.basketService.basketBooks;
    if (this.basketBooks.length > 0) {
      this.basket = false;
    } else {
      this.basket = true;
    }
 
  }
  basket: boolean = true;
  onCountChanged() {
    this.basketService.productCountChanged.emit(this.basketService.getProductCount());
  }
  onDelete(counter: number) {
    this.basketBooks.splice(counter, 1);
    this.basketService.productCountChanged.emit(this.basketService.getProductCount());
    if (this.basketBooks.length > 0) {
      this.basket = false;
    } else {
      this.basket = true;
    }
  }
  getAllBookPrice():number{
    let price=0;
    for (let index = 0; index < this.basketBooks.length; index++) {
      const b = this.basketBooks[index];
      price+=b.count*b.book.price;

      

      
    }
    price=Math.ceil(price*100)/100;
    
    return price;
  }
  onOrder(){
    this.basketBooks=[];
    this.router.navigate(["order"]);

  }
  ceilling(price:number,count:number):number{
    return Math.ceil(price*count*100)/100;
  }

}
