import { Injectable } from '@angular/core';
import { ImageBean } from '../model/imagebean';
import { API_URL } from '../constants';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class UploadService {


  constructor(private http:HttpClient) { }

  upload(file:File){//sekli upload edir
    let fd=new FormData();
    fd.append("file",file);
    return this.http.post<ImageBean>(`${API_URL}/fileupload`,fd);
  }
}
