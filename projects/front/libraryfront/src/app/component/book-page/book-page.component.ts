import { Component, OnInit, ViewChild } from '@angular/core';
import { API_URL } from 'src/app/constants';
import { UserService } from 'src/app/service/user.service';
import { MatDialog } from '@angular/material';
import { BookService } from 'src/app/service/book.service';
import { UserInfo } from 'src/app/model/user';
import { Book } from 'src/app/model/book';
import { AgGridAngular } from 'ag-grid-angular';
import { NewBookComponent } from '../new-book/new-book.component';
import { Router } from '@angular/router';
import { GridOptions } from 'ag-grid-community';

@Component({
  selector: 'app-book-page',
  templateUrl: './book-page.component.html',
  styleUrls: ['./book-page.component.css']
})
export class BookPageComponent implements OnInit {

  @ViewChild('agGrid', { static: false }) agGrid: AgGridAngular;

  books: Book[] = [];

  users: UserInfo[] = [];

  name: string = '';
  gridOptions: GridOptions;

  constructor(private userService: UserService, private matDialog: MatDialog, private bookService: BookService,private router:Router) { }
  username: string = '';

  ngOnInit() {
    
    if(this.userService.getUsername()===''){
      this.router.navigate(["selling-book"]);
    }else{
      
    this.username = this.userService.getUsername();
    this.downloadPath = API_URL + '/filedownload/files/';

    this.userService.getAllUser().subscribe(//butun userleri getirir
      resp => {
        this.users = resp;

        for (let index = 0; index < this.users.length; index++) {
          const u = this.users[index];
          if (u.username === this.username) {
            this.name = u.name + ' ' + u.surname;
            break;
          }

        }
      }
    );

    this.load();

    }


  }
  downloadPath: string;
  newBook() {//Yeni kitab ucun sehifeni acir
    let dialog = this.matDialog.open(NewBookComponent);
    dialog.afterClosed().subscribe(
      resp => {
        this.load();
      }
    );

  }
  load() {//butun kitablari getirir user ve enabled leye gore
    this.bookService.findAll(this.userService.userId).subscribe(data => {
      this.books = data;
    });
  }


  popoverTitle: string = 'Təsdiq';
  popoverMessage: string = 'Kiatbı Silməyə əminsiniz?';

selected:boolean=false;


  columnDefs = [
    { headerName: 'Id', field: 'id', sortable: true, filter: true, checkboxSelection: true, width: 100 },
    { headerName: 'Ad', field: 'name', sortable: true, filter: true },
    { headerName: 'Təsvir', field: 'description', sortable: true, filter: true },
    { headerName: 'Səhifə Sayı', field: 'pageCount', sortable: true, filter: true },
    { headerName: 'Qiymət', field: 'price', sortable: true, filter: true },
    { headerName: 'Müəllif', field: 'author', sortable: true, filter: true },


  ];


  private gridApi;

  onGridReady(event) {
    this.gridApi = event.api;
  }

  searchText: string = '';

  quickSearch() {//suretli axtaris
    this.gridApi.setQuickFilter(this.searchText);
  }
  
  deleteSelected(bool: boolean) {//kitabi silmek ucun
    const selectedRows = this.agGrid.api.getSelectedRows();
    if (bool) {
    
    if (selectedRows.length > 0) {
    


        let id: number = selectedRows[0].id;
        this.bookService.disabled(id).subscribe(
          resp => {
            this.load();
          }
        );

      }
     else{
      alert("Secilen Yoxdur");
      
    }
  }
    else {

    }
  }
  editSelected() {//kitabi redakte etmek ucun
    console.log(this.agGrid.api.getSelectedRows);
    const selectedRows = this.agGrid.api.getSelectedRows();
    if (selectedRows.length > 0) {
      let id: number = selectedRows[0].id;
      this.bookService.selectedBookId = id;
      this.bookService.findById(id).subscribe(
        resp => {

        }
      );
      let dialog = this.matDialog.open(NewBookComponent);
      dialog.afterClosed().subscribe(
        resp => {
          this.load();
          this.bookService.selectedBookId = 0;
        }
      );
    }else{
      alert("Secilen Yoxdur");
    }
  }
 

}
