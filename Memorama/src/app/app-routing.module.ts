import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { MainComponent } from './main/main.component';
import { BoardComponent } from './board/board.component';
import { ScoreboardComponent } from './scoreboard/scoreboard.component';

const appRoutes: Routes = [
  {path: '', redirectTo: '/main', pathMatch: 'full'},
  { path: 'main', component: MainComponent },
  { path: 'board', component: BoardComponent },
  { path: 'scoreboard', component: ScoreboardComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(appRoutes)],
  exports: [RouterModule]
})
export class AppRoutingModule {

}
