import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './component/login/login.component';
import { LogoutComponent } from './component/logout/logout.component';
import { BookPageComponent } from './component/book-page/book-page.component';
import { SellingBookComponent } from './component/selling-book/selling-book.component';




const routes: Routes = [
  { path: 'login', component: LoginComponent },
  { path: '', component: LoginComponent },
  {path:'logout',component:LogoutComponent},
  {path:'book-page',component:BookPageComponent},
  {path:'selling-book',component:SellingBookComponent},


];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
