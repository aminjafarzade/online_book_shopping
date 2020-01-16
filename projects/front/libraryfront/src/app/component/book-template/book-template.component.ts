import { Component, OnInit, Input } from '@angular/core';
import { BasketBook } from 'src/app/model/basket';
import { API_URL } from 'src/app/constants';
import { BasketService } from 'src/app/service/basket.service';
import { Book } from 'src/app/model/book';

@Component({
  selector: 'app-book-template',
  templateUrl: './book-template.component.html',
  styleUrls: ['./book-template.component.css']
})
export class BookTemplateComponent implements OnInit {

 
  @Input('book') book: Book;

  constructor(private basketService: BasketService) { }
  downloadPath: string;
  name:string='';
  description:string='';
  ngOnInit() {
    this.downloadPath = API_URL + '/filedownload/files/';
    this.description=this.book.description;
    this.name=this.book.name;
    if (this.book.name.length > 9) {
      this.name = this.book.name.substr(0, 9) + '...';

    }
    if(this.book.description.length>9){
      this.description=this.book.description.substr(0,9)+'...';
    }
    console.log(this.description);
  }

  addBasket() {//kitabi sebete elave edir eger sebet de varsa onun sayin artirir
    
    let thisBookAlreadyInBasket: boolean = false;
    let basketBooks = this.basketService.basketBooks;
    for (let index = 0; index < basketBooks.length; index++) {
      const basketBook = basketBooks[index];
      if (basketBook.book.id === this.book.id) {
        thisBookAlreadyInBasket = true;
        basketBook.count++; break;
      }

    }
   
    if(basketBooks.length>0){
      if(basketBooks[0].book.userId===this.book.userId){
        if(thisBookAlreadyInBasket){

        }else{
          let basketBook:BasketBook=new BasketBook(0);
          basketBook.book=this.book;
          this.basketService.basketBooks.push(basketBook);
          
        }
        
        let basketCount=0;
        for (let index = 0; index < basketBooks.length; index++) {
          basketCount+=basketBooks[index].count;
        }
        this.basketService.productCountChanged.emit(basketCount);
      }else{
        alert("Muxtelif userlerin mallari eyni vaxta sifaris oluna bilmez")
      }
    }else{
      if(thisBookAlreadyInBasket){

      }else{
        let basketBook:BasketBook=new BasketBook(0);
        basketBook.book=this.book;
        this.basketService.basketBooks.push(basketBook);
        
      }
      
      let basketCount=0;
      for (let index = 0; index < basketBooks.length; index++) {
        basketCount+=basketBooks[index].count;
      }
      this.basketService.productCountChanged.emit(basketCount);
    }
     
     
  
    
  }


}
