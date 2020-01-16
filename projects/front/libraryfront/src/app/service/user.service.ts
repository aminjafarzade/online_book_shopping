import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { UserInfo } from '../model/user';
import { API_URL } from '../constants';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  username: string = '';
  constructor(private http: HttpClient) { }
  userId: number = 0;
  userHas: boolean = false;

  setUsername(username: string) {/** Usernami gelen username ye set edir */
    this.username = username;
  }
  getUsername() {/** Usernami geri qaytarir */
    return this.username;
  }

  getAllUser() {/** Butun userleri qaytarir */
    return this.http.get<UserInfo[]>(`${API_URL}/users`);
  }

  addUser(userInfo: UserInfo) {/** User elave edir */
    return this.http.post<number>(`${API_URL}/users`, userInfo);

  }



}
