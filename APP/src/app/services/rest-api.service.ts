import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { catchError, Observable, retry, throwError } from 'rxjs';
import { Card } from '../models/card.model';
import { User } from '../models/user.model';


@Injectable({
  providedIn: 'root'
})
export class RestApiService {
  private apiURL = 'http://localhost:8000';
  public CardID : any;
  public UserID: string=  '';

  constructor(private http: HttpClient) { }

    
  createUser(newUser:User){
    return this.http.post(this.apiURL+'/User', newUser)
  }

  getAllCards(){
    debugger;
    return this.http.get(this.apiURL+'/Card')
  }

  updateCard(cardData:Card){
    return this.http.put(this.apiURL+'/Card/'+this.CardID, cardData)
  }

  createCard(cardData:Card){debugger;
    return this.http.post(this.apiURL+'/Card', cardData)
  }


  getCardByID(){
    return this.http.get(this.apiURL+'/Card/'+ this.CardID)
  }}

