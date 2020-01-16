import { Injectable, EventEmitter } from '@angular/core';
import { BasketBook } from '../model/basket';

@Injectable({
  providedIn: 'root'
})
export class BasketService {

  basketBooks:BasketBook[]=[];
  productCountChanged=new EventEmitter<number>();
  constructor() { }

  getProductCount():number{
    let count=0;
    for (let index = 0; index < this.basketBooks.length; index++) {
      const b = this.basketBooks[index];
      count+=b.count;
      
    }
    return count;
  }
}
