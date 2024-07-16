import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CardComponent } from './components/card/card.component';
import { SingUpComponent } from './components/sign-up/sign-up.component';
import { ShowCardComponent } from './components/show-card/show-card.component';

const routes: Routes = [
  { path: '', pathMatch: 'full', redirectTo: 'sign-up' },
  { path:'sign-up', component: SingUpComponent},
  { path: 'card', component: CardComponent },
  { path: 'show-card', component: ShowCardComponent },

]  

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
