import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { Card } from 'src/app/models/card.model';
import { RestApiService } from 'src/app/services/rest-api.service';

@Component({
  selector: 'app-popup-dialog',
  templateUrl: './popup-dialog.component.html',
  styleUrls: ['./popup-dialog.component.css']
})
export class PopupDialogComponent implements OnInit {

  cards: Card[] | undefined;

  constructor(public apiService: RestApiService,
    public dialogRef: MatDialogRef<PopupDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any
  ) { }


  ngOnInit() {
    this.apiService.getAllCards().subscribe({

      next: (data: any) => {
        debugger;
        if (data) {
          this.cards = data;
        }
      },
      error: (error) => {
        console.error('Error: ', error);
      }
    });

  }



  onNoClick(): void {
    this.dialogRef.close();
  }

  selectCard(card: any): void {
    this.dialogRef.close(card);
  }
  applyStyles(styles: string) {
    const styleObj: { [key: string]: string } = {};
    styles.split(';').forEach(style => {
      if (style.trim()) {
        const [key, value] = style.split(':');
        styleObj[key.trim()] = value.trim();
      }
    });
    return styleObj;
  }

}