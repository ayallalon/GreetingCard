import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { ReactiveFormsModule } from '@angular/forms';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { CardComponent } from './components/card/card.component';
import { FormsModule } from '@angular/forms';
import { SingUpComponent } from './components/sign-up/sign-up.component';
import { RestApiService } from './services/rest-api.service';
import { HttpClientModule } from '@angular/common/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MaterialModule } from './material/material.module';
import { PopupDialogComponent } from './components/popup-dialog/popup-dialog.component';
import { ShowCardComponent } from './components/show-card/show-card.component';
import { MatSnackBar } from '@angular/material/snack-bar';
//import { PopupDialogComponent } from './popup-dialog/popup-dialog.component';

@NgModule({
  declarations: [
    AppComponent,
    CardComponent,
    SingUpComponent,
    PopupDialogComponent,
    ShowCardComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MaterialModule,
    ReactiveFormsModule,
    FormsModule
   
  ],
  providers: [RestApiService, MatSnackBar ],
  bootstrap: [AppComponent]
})
export class AppModule { }
