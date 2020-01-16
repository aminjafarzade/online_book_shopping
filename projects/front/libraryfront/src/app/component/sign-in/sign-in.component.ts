import { Component, OnInit } from '@angular/core';
import { UserInfo } from 'src/app/model/user';
import { UserService } from 'src/app/service/user.service';
import { Router } from '@angular/router';


@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.css']
})
export class SignInComponent implements OnInit {

  userInfo: UserInfo = new UserInfo('', '');

  usernames: string[] = [];
  constructor(private userService: UserService,private router :Router) { }

  ngOnInit() {
    this.userService.getAllUser().subscribe(
      resp => {
        for (let index = 0; index < resp.length; index++) {
          this.usernames.push(resp[index].username);

        }
      }
    );


  }
  isUsernameValidated() {
    if (this.usernames.includes(this.userInfo.username)) {
      return true;
    } else {
      return false;
    }
  }

  signIn() {
    this.userService.addUser(this.userInfo).subscribe(
      resp=>{
        this.userService.userHas=true;
        alert("Uğurlu Əməliyyat");
        
        
      }
    );


  }
  errorMessage: string = "Melumatlari Tam Yaz";
  usernameErrorMessage: string = "İstifadəçi Adı Artıq Var";

}
