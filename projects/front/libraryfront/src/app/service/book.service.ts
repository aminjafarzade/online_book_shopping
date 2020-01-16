import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Book } from '../model/book';
import { API_URL } from '../constants';

@Injectable({
  providedIn: 'root'
})
export class BookService {

  
  constructor(private http:HttpClient) { }
  book:Book[]=[];
  selectedBookId:number=0;
  bookUrl:string='';

  addBook(p:Book){
    return this.http.post<number>(`${API_URL}/books`,p);
  }
  findAll(userId:number){
    return this.http.get<Book[]>(`${API_URL}/books/find-all/${userId}`);
  }
  disabled(b:number){
    return this.http.put(`${API_URL}/books/updatebook`,b);
  }
  findById(id:number){
    return this.http.get<Book>(`${API_URL}/books/${id}`);
  }
  update(p:Book){
    return this.http.put(`${API_URL}/books`,p);

  }
  search(search:string,begin:number,length:number){
    return this.http.get<Book[]>(`${API_URL}/books/search/${search}/${begin}/${length}`);
  }
  findPartial(begin:number,length:number){
    return this.http.get<Book[]>(`${API_URL}/books/find-partial/${begin}/${length}`);
  }
  bookServiceLoaded:boolean=false;
}
