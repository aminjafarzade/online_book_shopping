import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/service/user.service';
import { Router } from '@angular/router';
import { MatDialog } from '@angular/material';
import { UserInfo } from 'src/app/model/user';
import { SignInComponent } from '../sign-in/sign-in.component';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {



  constructor(private userService: UserService, private router: Router, private matDialog: MatDialog) { }

  username: string = '';
  password: string = '';
  users: UserInfo[] = [];

  ngOnInit() {
    this.userService.setUsername('');
    this.userService.getAllUser().subscribe(
      resp => {
        this.users = resp;
      }
    );

  }
  message: string = '';
  validate: boolean = false;
  onLogin() {/** Hesaba daxil olur */
    for (let index = 0; index < this.users.length; index++) {
      if (this.users[index].username.includes(this.username) && this.users[index].password.includes(this.password)) {
        this.validate = true;
        break;
      }

    }
    if (this.username === '' && this.password === '') {
      this.message = 'User Yoxdur';
    } else {
      if (this.validate) {
        this.message = '';

        this.userService.setUsername(this.username);
        this.router.navigate(["book-page"]);

      } else {
        this.message = 'User Yoxdur';
      }
    }



  }




create() {
    let dialog = this.matDialog.open(SignInComponent);
    dialog.afterClosed().subscribe(
      resp => {
        this.userService.getAllUser().subscribe(
          resp => {
            this.users = resp;
          }
        );
        console.log(resp);
      }
    );
  } 

}
