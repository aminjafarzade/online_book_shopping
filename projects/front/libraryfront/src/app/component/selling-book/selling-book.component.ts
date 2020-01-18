import { Component, OnInit } from '@angular/core';
import { BasketComponent } from '../basket/basket.component';
import { API_URL } from 'src/app/constants';
import { Book } from 'src/app/model/book';
import { UploadService } from 'src/app/service/upload.service';
import { MatDialog } from '@angular/material';
import { BookService } from 'src/app/service/book.service';
import { BasketService } from 'src/app/service/basket.service';

@Component({
  selector: 'app-selling-book',
  templateUrl: './selling-book.component.html',
  styleUrls: ['./selling-book.component.css']
})
export class SellingBookComponent implements OnInit {

  productCount: number = 0;
  searchText: string = '';
  constructor(private uploadService: UploadService, private matDialog: MatDialog, private bookService: BookService, private basketService: BasketService) { }
  books: Book[] = [];
  downloadPath: string;
  ngOnInit() {
    this.downloadPath = API_URL + '/filedownload/files/';
    this.bookService.findPartial(this.begin, this.length).subscribe(
      resp => {
        this.books = resp;
        this.bookService.bookServiceLoaded = true;

      }


    );
    this.basketService.productCountChanged.subscribe(//kitab sayi deyisende onu 200ms le gosterir
      resp => {
        this.showBasket = false;
        setTimeout(
          () => {
            this.showBasket = true;
          }, 200
        );

        this.productCount = resp;

      }
    );


  }
  showBasket: boolean = true;
  onOpenBasket() {//basketi acir
    this.matDialog.open(BasketComponent);

  }
  findBySearch() {//axtaris edir
    window.scrollTo(0, 0);
    this.begin=0;
    if (this.searchText === '') {
      
      this.bookService.findPartial(this.begin, this.length).subscribe(
        resp => {
          this.books = resp;
        }
      );

    } else {
      
      this.bookService.search(this.searchText, this.begin, this.length).subscribe(
        resp => {
          this.books = resp;
        }
      );
    }


  }
  begin: number = 0;
  length: number = 10;
  onScroll() {//infinite scroll u aktiv edir
    this.begin += 10;
 
      if(this.searchText===''){
        this.begin=0;
        this.bookService.findPartial(this.begin, this.length).subscribe(
          resp => {
            this.books.push(...resp);
  
  
          });
      }else{
        this.bookService.search(this.searchText,this.begin, this.length).subscribe(
          resp => {
            this.books.push(...resp);
  
  
          });
      }
    



  }
}
