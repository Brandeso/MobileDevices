import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { TableroComponent } from './tablero/tablero.component';
import { LoginComponent } from './login/login.component';
import { MainComponent } from './main/main.component';
import { AppRoutingModule } from './app-routing.module';
import { HomeComponent } from './home/home.component';
import { ScoreboardComponent } from './scoreboard/scoreboard.component';

// Material imports
import { MatSidenavModule, MatListModule, MatToolbarModule, MatIconModule, MatProgressBarModule, MatCardModule,
   MatFormFieldModule,
   MatInputModule, } from '@angular/material';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

// Font awesome

import { FontAwesomeModule, FaIconLibrary } from '@fortawesome/angular-fontawesome';
import { fas, faSquare, faBars, faDatabase, faCloud, faHome, faSignOutAlt } from '@fortawesome/free-solid-svg-icons';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

@NgModule({
  declarations: [
    AppComponent,
    TableroComponent,
    LoginComponent,
    MainComponent,
    HomeComponent,
    ScoreboardComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    MatSidenavModule,
    MatListModule,
    MatToolbarModule,
    MatIconModule,
    BrowserAnimationsModule,
    FontAwesomeModule,
    MatProgressBarModule,
    MatCardModule,
    MatFormFieldModule,
    MatInputModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {
  constructor(library: FaIconLibrary) {
    library.addIconPacks(fas);
    library.addIcons(faSquare, faBars, faDatabase, faCloud, faHome, faSignOutAlt);
  }
}
