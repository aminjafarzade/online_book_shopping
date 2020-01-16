import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { OrderModel } from '../model/order';
import { API_URL } from '../constants';

@Injectable({
  providedIn: 'root'
})
export class OrderService {

  constructor(private http:HttpClient) { }
  addOrder(o:OrderModel){
    return this.http.post<number>(`${API_URL}/orders`,o);
  }
  findAll(){
    return this.http.get<OrderModel[]>(`${API_URL}/orders`);
  }
  search(search:string){
    return this.http.get<OrderModel[]>(`${API_URL}/orders/search/${search}`);
  }
}
