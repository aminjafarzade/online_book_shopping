import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class StudentGuardService implements CanActivate {

  canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) {

    let result: boolean = false;
    let user: string = sessionStorage.getItem('username');
    
    if (user != null) {
      result = true;
    } else {
      result = false;
      this.router.navigate(['login']);
    }



    return result;

  }
  constructor(private router: Router) { }
}
