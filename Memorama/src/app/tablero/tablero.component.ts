import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-tablero',
  templateUrl: './tablero.component.html',
  styleUrls: ['./tablero.component.css']
})
export class TableroComponent implements OnInit {

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

  constructor() {}
  ngOnInit() {}

  iniciarJuego() {}

  resetearJuego() {}

  girarCarta() {}

  vaciar() {}

  colorCambio() {}

  comprobar() {}
}
