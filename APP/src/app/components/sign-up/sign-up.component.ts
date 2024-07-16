import { Component } from '@angular/core';
import { User } from 'src/app/models/user.model';
import { RestApiService } from 'src/app/services/rest-api.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';

@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls: ['./sign-up.component.css']
})
export class SingUpComponent {
  newUser: User = {
    UserID: '',
    UserName: '',
    Email: '',
    Password: ''
  };
  constructor(private apiService: RestApiService, private _snackBar: MatSnackBar,
    private router: Router) { }


  onSubmit() {
    this.apiService.createUser(this.newUser).subscribe({
      next: (data: any) => {
        if (data) {
          this.apiService.UserID = this.newUser.UserID;
          this._snackBar.open('User added successfully!', 'Close', {
          }).afterDismissed().subscribe(() => {
            this.router.navigate(['/card']);
          });
        }
      },
      error: (error) => {
        console.error('Error: ', error);
        this._snackBar.open('Failed to add user: ' + error.message, 'Close', {
        });
      }
    });
  }
  
  setAdmin() {
    this.apiService.UserID = '1';
    this.router.navigate(['/card']);

  }
}

