import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { PopupDialogComponent } from '../popup-dialog/popup-dialog.component';
import { RestApiService } from 'src/app/services/rest-api.service';
import { Card } from 'src/app/models/card.model';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';

@Component({
  selector: 'app-card',
  templateUrl: './card.component.html',
  styleUrls: ['./card.component.css']
})
export class CardComponent implements OnInit {

  selectedBackground: string = '';
  cardText: string = ' שנה טובה לצוות שלי';
  selectedTextColor: string = '#2e2323'; // צבע טקסט דיפולטיבי
  selectedTextSize: Number = 2;
  selectedTextAlign: string = 'center';
  showPopup: boolean = false;
  data: any;
  edited: boolean = false;
  cardData: Card | undefined;


  constructor(private apiService: RestApiService, public dialog: MatDialog,
    private _snackBar: MatSnackBar, private router: Router) { }

  @ViewChild('textarea') textarea!: ElementRef;

  ngOnInit() {
    this.selectDefaultBackground();
  }

  ngAfterViewInit() {
    this.adjustTextareaSize();
  }

  adjustTextareaSize() {
    const textarea = this.textarea.nativeElement;
    textarea.style.height = 'auto'; // Reset the height to auto
    textarea.style.width = 'auto'; // Reset the width to auto
    textarea.style.height = `${textarea.scrollHeight}px`; // Set the height to scrollHeight
    textarea.style.width = `${textarea.scrollWidth}px`; // Set the width to scrollWidth
  }


  selectBackground(background: string) {
    this.selectedBackground = background;
  }

  selectDefaultBackground() {
    this.selectedBackground = '/assets/images/Background2.png';
  }




  sendEmail() {
    this.saveCard();
    const subject = 'ברכה לראש השנה';
    const body = `מצורף ברכה בלינק הבא:\n http://localhost:4200/show-card`;
    const emailAddress = 'ayallalon@gmail.com';
    const mailtoLink = `mailto:${emailAddress}?subject=${encodeURIComponent(subject)}&body=${encodeURIComponent(body)}`;
    window.open(mailtoLink, '_top');
  }

  saveCard() {
    debugger;
    this.cardData = {
      UserID: this.apiService.UserID,
      Style: ` color: ${this.selectedTextColor}; font-size: ${this.selectedTextSize}; text-align: ${this.selectedTextAlign}`,
      Text: this.cardText,
      Background: this.selectedBackground
    };
    if (this.edited) {
      this.apiService.updateCard(this.cardData).subscribe({
        next: (data: any) => {
          console.log(data.message);
          this._snackBar.open('Card saved successfully', 'Close', {
          });
        },
        error: (error) => {
          console.error('Error: ', error);
        }
      });
    } else {
      this.apiService.createCard(this.cardData).subscribe({
        next: (data: any) => {
          console.log(data.message);
          this.apiService.CardID = data.CardID;
          debugger;
          this._snackBar.open('Card saved successfully', 'Close', {
          });
        },
        error: (error) => {
          console.error('Error: ', error);
        }
      });
    }
  }

  editCard(card: any) {
    debugger;
    this.cardText = card.Text;
    this.selectedBackground = card.Background;
    this.applyStyles(card.Style);
    this.showPopup = false;
    this.edited = true;
    this.apiService.CardID = card.CardID
  }


  applyStyles(styles: string) {
    const styleObj: { [key: string]: string } = {};
    styles.split(';').forEach(style => {
      if (style.trim()) {
        const [key, value] = style.split(':');
        styleObj[key.trim()] = value.trim();
      }
    });
    Object.assign(this.textarea.nativeElement.style, styleObj);
  }


  openPopup() {
    const dialogRef = this.dialog.open(PopupDialogComponent, {
      width: '700px',
      height: '400px'

    });

    dialogRef.afterClosed().subscribe(result => {
      if (result) {
        this.editCard(result);
      }
    });
  }


  showCard() {
    this.router.navigate(['/show-card']);

  }

}