import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { AgGridModule } from 'ag-grid-angular';
import { DataTablesModule } from 'angular-datatables';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatInputModule, MatDialogModule, MatProgressSpinnerModule, MatButtonModule } from '@angular/material';
import { ConfirmationPopoverModule } from 'angular-confirmation-popover';
import { MenuComponent } from './component/menu/menu.component';
import { LoginComponent } from './component/login/login.component';

import { AppRoutingModule } from './app-routing.module';
import { FormsModule } from '@angular/forms';
import {HttpClientModule, HTTP_INTERCEPTORS} from '@angular/common/http';
import { BasicInterceptorService } from './service/basic-interceptor.service';
import { SignInComponent } from './component/sign-in/sign-in.component';
import { LogoutComponent } from './component/logout/logout.component';
import { BookPageComponent } from './component/book-page/book-page.component';
import { NewBookComponent } from './component/new-book/new-book.component';
import { SellingBookComponent } from './component/selling-book/selling-book.component';
import { BasketComponent } from './component/basket/basket.component';
import { OrderPageComponent } from './component/order-page/order-page.component';
import { BookTemplateComponent } from './component/book-template/book-template.component';
import { InfiniteScrollModule } from 'ngx-infinite-scroll';
import { OrderedBookComponent } from './component/ordered-book/ordered-book.component';

@NgModule({
  declarations: [
    AppComponent,
    MenuComponent,
    LoginComponent,
    SignInComponent,
    LogoutComponent,
    BookPageComponent,
    NewBookComponent,
    SellingBookComponent,
    BasketComponent,
    OrderPageComponent,
    BookTemplateComponent,
    OrderedBookComponent,

  ],
  imports: [
    BrowserModule,
      AppRoutingModule,
    FormsModule,
    HttpClientModule,
    AgGridModule.withComponents([]),
    BrowserAnimationsModule,
    DataTablesModule,
    BrowserAnimationsModule,
    MatInputModule,
    MatDialogModule,
    MatProgressSpinnerModule,
    MatButtonModule,
    ConfirmationPopoverModule.forRoot({
      confirmButtonType: 'success', cancelButtonType: 'danger', confirmText: 'Təsdiq', cancelText: 'Ləğv'
    }),
    InfiniteScrollModule
    


  ],
  providers: [
    {
      provide:HTTP_INTERCEPTORS,useClass:BasicInterceptorService,multi:true
      
    }
  ],
  entryComponents:[SignInComponent,NewBookComponent,BasketComponent],
  bootstrap: [AppComponent]

})
export class AppModule { }
