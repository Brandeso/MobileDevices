import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  constructor() {}

  cartas = [
    {nombre: '1', seleccion: false}, {nombre: '2', seleccion: false},
    {nombre: '3', seleccion: false}, {nombre: '4', seleccion: false},
    {nombre: '5', seleccion: false}, {nombre: '6', seleccion: false},
    {nombre: '7', seleccion: false}, {nombre: '8', seleccion: false},
    {nombre: '1', seleccion: false}, {nombre: '2', seleccion: false},
    {nombre: '3', seleccion: false}, {nombre: '4', seleccion: false},
    {nombre: '5', seleccion: false}, {nombre: '6', seleccion: false},
    {nombre: '7', seleccion: false}, {nombre: '8', seleccion: false} ];

  intentos = 0;
  jugada1 = '';
  jugada2 = '';
  identificadorJ1 = '';
  identificadorJ2 = '';

  title = 'Memorama';

  iniciarJuego() {
    const dato = document.getElementById('juego');
    // dato.style.opacity = 1;

    this.cartas.sort();
    for ( let i = 0 ; i < 16 ; i++ ) {
      const carta = this.cartas[i].nombre;
      // tslint:disable-next-line: no-shadowed-variable
      const dato = document.getElementById( i.toString() );
      dato.dataset.valor = carta;
    }
  }
  resetearJuego() {
    this.cartas.sort();
    for ( let i = 0 ; i < 16 ; i++ ) {
      const carta = this.cartas[i].nombre;
      const dato = document.getElementById( i.toString() );
      dato.dataset.valor = carta;
      this.colorCambio( i, 'black', '?');
    }
  }

  girarCarta() {
    // tslint:disable-next-line: deprecation
    const evento = window.event;

    // this.jugada2 = evento.target.dataset.valor;
    // this.identificadorJ2 = evento.target.id;


    if ( this.jugada1 !== '' ) {

      if ( this.jugada1 === this.jugada2 && this.identificadorJ1 !== this.identificadorJ2 &&
        this.cartas[parseInt(this.identificadorJ2, 10)].seleccion !== true &&
        this.cartas[parseInt(this.identificadorJ1, 10)].seleccion !== true) {

        this.cartas[parseInt(this.identificadorJ1, 10)].seleccion = true;
        this.cartas[parseInt(this.identificadorJ2, 10)].seleccion = true;

        this.colorCambio(this.identificadorJ2, 'blue', this.jugada2);
        this.vaciar();
        this.comprobar();
      } else if (this.identificadorJ1 !== this.identificadorJ2) {
        const self = this;
        setTimeout( () => {
          this.colorCambio(self.identificadorJ1, 'black', '?');
          this.colorCambio(self.identificadorJ2, 'black', '?');
          this.vaciar();
        }, 200);

        this.colorCambio(this.identificadorJ2, 'blue', this.jugada2);
      }
    } else if (this.jugada2 !== 'valor') {

      this.colorCambio(this.identificadorJ2, 'blue', this.jugada2);

      this.jugada1 = this.jugada2;
      this.identificadorJ1 = this.identificadorJ2;
    }
  }
    vaciar()  {
    this.jugada1 = '';
    this.jugada2 = '';

    this.identificadorJ1 = '';
    this.identificadorJ2 = '';
  }

    colorCambio(posicion, color, contenido) {
    document.getElementById(posicion.toString()).style.backgroundColor = color;
    document.getElementById(posicion.toString()).innerHTML = contenido;
  }

    comprobar() {
    let aciertos = 0;
    for (let i = 0 ; i < 16 ; i++ ) {
      if ( this.cartas[i].seleccion === true ) {
        aciertos ++;
      }

    }

    if (aciertos === 16) {
      document.getElementById('juego').innerHTML = 'GANASTE';
    }
  }
}
