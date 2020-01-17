import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { OrderModel } from '../model/order';
import { API_URL } from '../constants';

@Injectable({
  providedIn: 'root'
})
export class OrderService {

  constructor(private http:HttpClient) { }
  addOrder(o:OrderModel){//sifaris elave edir
    return this.http.post<number>(`${API_URL}/orders`,o);
  }
  findAll(){//butun sifarisleri getirir
    return this.http.get<OrderModel[]>(`${API_URL}/orders/find`);
  }
  search(search:string){//sifarisler uzerinde axtaris edir
    return this.http.get<OrderModel[]>(`${API_URL}/orders/search/${search}`);
  }
}
