import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
// import { AuthFirebaseService } from '../../services/auth-firebase.service';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  login = false;
  pathObs: Subscription;

  constructor(
    private activatedRoute: ActivatedRoute,
    private router: Router,
    // private authFireSrv: AuthFirebaseService
  ) { }

  ngOnInit() {
    this.subscribe();
    this.pathObs = this.router.events.subscribe(path => {
       // tslint:disable: no-string-literal
       if (path['url'] === '/main') {
         this.login = true;
         this.pathObs.unsubscribe();
       }
    });
  }

  logOut() {
    // this.authFireSrv.logOut().then(() => {
    //   this.subscribe();
    // });

    // this.pathObs = this.router.events.subscribe(path => {
    //   if (path['url'] === '/main') {
    //     this.login = true;
    //     this.pathObs.unsubscribe();
    //   }
    // });
  }

  subscribe() {
    // this.authFireSrv.onAuthStateChanged((user) => {
    //   if (user && localStorage.getItem('tenant')) {
       this.login = true;

         // tslint:disable-next-line: align
         if (this.router.url === '/login') {
           this.router.navigate(['/main']);
//         }
       } else {
         this.login = false;
         this.router.navigate(['/login']);
       }
//     });
  }
}
