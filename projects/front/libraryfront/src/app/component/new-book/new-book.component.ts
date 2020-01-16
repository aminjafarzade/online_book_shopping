import { Component, OnInit } from '@angular/core';
import { BookService } from 'src/app/service/book.service';
import { UserInfo } from 'src/app/model/user';
import { Book } from 'src/app/model/book';
import { UserService } from 'src/app/service/user.service';
import { UploadService } from 'src/app/service/upload.service';

@Component({
  selector: 'app-new-book',
  templateUrl: './new-book.component.html',
  styleUrls: ['./new-book.component.css']
})
export class NewBookComponent implements OnInit {
  book: Book = new Book();
  users: UserInfo[] = [];
  user: UserInfo = new UserInfo('', '');
  type:string='';
  constructor(private uploadService: UploadService, private bookService: BookService, private userService: UserService) { }

  ngOnInit() {
    console.log(this.bookService.selectedBookId);
    if (this.bookService.selectedBookId > 0) {

      this.bookService.findById(this.bookService.selectedBookId).subscribe(
        resp => {
          this.book = resp;
          this.book.userId=this.userService.userId;
          console.log(this.book);
        }
      );
      console.log(this.book);
      this.type='Kitab Redaktesi';

    } else {
      this.type='Yeni Kitab Qeydiyyati';

    }

    this.userService.getAllUser().subscribe(
      resp => {

      
      }
    );




  }
  image: File;
  imageSelected(event) {


    this.image = (<File[]>event.target.files)[0];
    if (this.image === undefined) {
      this.image = null;
      console.log("image selection cancelled")
    } else {


    }

  }


  errorMessage: string = '';
  saveBook() {
    if (this.userService.username === '') {

    } else {
      if(this.bookService.selectedBookId>0){
        if(this.image===undefined){
          this.bookService.findById(this.bookService.selectedBookId).subscribe(
            resp=>{
              
              console.log(resp);
            }
          );
          this.bookService.update(this.book).subscribe(
            resp=>{
              alert('Uğurlu Redaktə');
            }
          );
        }else{
          this.uploadService.upload(this.image).subscribe(
            resp => {
              this.book.image = resp.image;
              this.bookService.update(this.book).subscribe(
                resp=>{alert('Uğurlu Redaktə');}
              );
            }
            
          );
        }
        
  
      }else{
        
          for (let index = 0; index < this.users.length; index++) {
            if (this.users[index].username.includes(this.userService.username)) {
              this.user = this.users[index];
    
              console.log(this.user);
              break;
    
            }
    
          }
          this.uploadService.upload(this.image).subscribe(
            resp => {
              this.book.image = resp.image;
              this.bookService.addBook(this.book).subscribe(
                resp => {
                  alert('Uğurlu Əməliyyat');
    
    
    
                }
              );
            }
            
          );
          this.errorMessage='Məlumatları Tam Yaz';
        }
    }
  }

}
