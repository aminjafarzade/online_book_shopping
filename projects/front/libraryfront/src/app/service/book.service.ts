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

  addBook(p:Book){// kitab elvaesi
    return this.http.post<number>(`${API_URL}/books`,p);
  }
  findAll(userId:number){//butun kitablari qaytarir userId e gore
    return this.http.get<Book[]>(`${API_URL}/books/find-all/${userId}`);
  }
  disabled(b:number){//kitabi silir yeni disabled edir
    return this.http.put(`${API_URL}/books/updatebook`,b);
  }
  findById(id:number){//kitab id sine gore axtaris edir
    return this.http.get<Book>(`${API_URL}/books/${id}`);
  }
  update(p:Book){//verilen kitabi redakte edir
    return this.http.put(`${API_URL}/books`,p);

  }
  search(search:string,begin:number,length:number){//axtaris edir infinite scroll da daxildir
    return this.http.get<Book[]>(`${API_URL}/books/search/${search}/${begin}/${length}`);
  }
  findPartial(begin:number,length:number){//infinite scroll a gore kitablari getirir
    return this.http.get<Book[]>(`${API_URL}/books/find-partial/${begin}/${length}`);
  }
  bookServiceLoaded:boolean=false;
}
