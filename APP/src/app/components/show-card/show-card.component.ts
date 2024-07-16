import { Component, OnInit } from '@angular/core';
import { Card } from 'src/app/models/card.model';
import { RestApiService } from 'src/app/services/rest-api.service';

@Component({
  selector: 'app-show-card',
  templateUrl: './show-card.component.html',
  styleUrls: ['./show-card.component.css']
})
export class ShowCardComponent implements OnInit {
  card: Card = {
    UserID: this.apiService.UserID,
    Style: '',
    Text: '',
    Background: ''
  };
  constructor(private apiService: RestApiService) { }

  ngOnInit() {
    this.apiService.getCardByID().subscribe({
      next: (data: any) => {
        console.log(data);
        this.card = data;
      },
      error: (error) => {
        console.error('Error: ', error);
      }
    });
  }

  applyStyles(styles: string) {
    const styleObj: { [key: string]: string } = {};
    styles.split(';').forEach(style => {
      if (style.trim()) {
        const [key, value] = style.split(':');
        styleObj[key.trim()] = value.trim();
      }
    });
    console.log(styleObj);
    return styleObj;
  }
}
