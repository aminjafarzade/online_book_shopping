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
    


  ],
  providers: [
    {
      provide:HTTP_INTERCEPTORS,useClass:BasicInterceptorService,multi:true
      
    }
  ],
  entryComponents:[SignInComponent,NewBookComponent],
  bootstrap: [AppComponent]

})
export class AppModule { }
