## Proyecto: Agenda
### Materia: Software Engineering for Mobile Devices
#### Autores: 
##### – Bruno Amezcua Arévalo
##### – Erick Rafael Vázquez Leyte
> Este proyecto fue reservado usando Flutter y Dart.<br>
> Está pensado para ser utilizando en dispositivos móviles en los sistemas operativos iOS y Android.<br>
> Las pruebas se realizaron en iPhone 7 (iOS 13.2) y Nexus 5 (Android X)

#### Cómo correr el proyecto:
##### Cosas que se necesitan:
– Flutter SDK (https://flutter.dev/docs/get-started/install)<br>
– Google Chrome (https://www.google.com/chrome/)<br>

##### En OS X y Linux
##### Actualizamos el path para incluir flutter
```
export PATH="$PATH:<PATH TO FLUTTER>/flutter/bin"
flutter doctor
```

##### Actualizamos a la última versión de Flutter en caso de ser necesario
```
flutter channel master
flutter upgrade
```

##### Habilitamos los navegadores web como ambientes de reproducción
```
flutter config --enable web
```

##### Verificamos que tengamos nuestros navegadores como dispositivos disponibles
```
flutter devices
```
##### Abrimos el proyecto en IntelliJ IDEA / Android Studio, Google Chrome / Web Server deberían aparecer como opciones para correr el proyecto


##### Para correr el proyecto en la terminal
```
flutter run -d chrome
```
