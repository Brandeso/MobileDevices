import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
// import { AuthFirebaseService } from '../../services/auth-firebase.service';
// import { CloudCaService } from '../../services/cloud-ca.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  constructor(
    private router: Router,
    // private authFireServ: AuthFirebaseService,
    // private caServ: CloudCaService,
  ) { }

  isLoading = false;
  fireLogin = false;

  fireEmailFormControl = new FormControl('', [
    Validators.required,
    Validators.email,
  ]);

  caEmailFormControl = new FormControl('', [
    Validators.required,
    Validators.email,
  ]);

  tenantFormControl = new FormControl('', [
    Validators.required,
    Validators.email,
  ]);

  fireLoginForm = new FormGroup({
    email: this.fireEmailFormControl,
    password: new FormControl('', [
      Validators.required
    ])
  });

  caLoginForm = new FormGroup({
    email: this.caEmailFormControl,
    password: new FormControl('', [
      Validators.required
    ]),
    tenant: this.tenantFormControl
  });

  ngOnInit() {
    // this.authFireServ.onAuthStateChanged((user) => {
      // if (user) {
        // this.fireLogin = true;
      // }
    // });
  }

  fireLogIn() {
    // this.isLoading = true;
    // this.authFireServ
    //   .logInEmailAndPassword(
    //     this.fireLoginForm.value.email,
    //     this.fireLoginForm.value.password
    //   )
    //   .then(() => {
    //     this.isLoading = false;
    //     this.fireLogin = true;
    //   })
    //   .catch(() => {
    //     this.isLoading = false;
    //   });
  }

  caLogIn() {
    // this.isLoading = false;
    // localStorage.setItem('email', this.caLoginForm.value.email);
    // localStorage.setItem('tenant', this.caLoginForm.value.tenant);
    // this.caServ.getToken({
    //   username: this.caLoginForm.value.email,
    //   password: this.caLoginForm.value.password,
    //   tenant: this.caLoginForm.value.tenant
    // }).then(data => {
    //   this.isLoading = false;
    //   localStorage.setItem('email', this.caLoginForm.value.email);
    //   localStorage.setItem('tenant', this.caLoginForm.value.tenant);
    //   localStorage.setItem('token', data.tkn);
    //   this.caServ.setToken(data.tkn, this.caLoginForm.value.tenant);
    //   this.router.navigate(['/main']);
    // },
    // error => {
    //   this.isLoading = false;
    //   console.log(error);
    // });
  }

}
