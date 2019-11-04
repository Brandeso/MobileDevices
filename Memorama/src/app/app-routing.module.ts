import { Routes, RouterModule } from '@angular/router';
import { NgModule } from '@angular/core';

import { LoginComponent } from '../app/login/login.component';
import { MainComponent } from '../app/main/main.component';
import { TableroComponent } from '../app/tablero/tablero.component';
import { ScoreboardComponent } from './scoreboard/scoreboard.component';

const appRoutes: Routes = [
  { path: '', redirectTo: '/login', pathMatch: 'full' },
  { path: 'login', component: LoginComponent },
  { path: 'main' , component: MainComponent },
  { path: 'tablero', component: TableroComponent },
  { path: 'scoreboard', component: ScoreboardComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(appRoutes)],
  exports: [RouterModule]
})

export class AppRoutingModule {}
