import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './component/login/login.component';
import { LogoutComponent } from './component/logout/logout.component';
import { BookPageComponent } from './component/book-page/book-page.component';
import { SellingBookComponent } from './component/selling-book/selling-book.component';
import { SignInComponent } from './component/sign-in/sign-in.component';
import { OrderPageComponent } from './component/order-page/order-page.component';




const routes: Routes = [
  {path:'login',component:LoginComponent},
  {path:'book-page',component:BookPageComponent},
  {path:'logout',component:LogoutComponent},
  {path:'sign-in',component:SignInComponent},
  {path:'selling-books',component:SellingBookComponent},

  {path:'',component:SellingBookComponent},
  {path:'order',component:OrderPageComponent},
  {path:'**',component:SellingBookComponent}

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
