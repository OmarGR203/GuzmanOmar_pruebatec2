# SISTEMA GUBERNAMENTAL PARA LA RESERVACIÓN DE CITAS PARA TRÁMITES O SERVICIOS
Prueba Tecnica número 2 de Java Avanzado para el Bootcamp de Hack a Boss.

## Descripcion
Este proyecto es un sistema de gestión de citas que permite a un unico superusuario realizar la reserva de citas para trámites o servicios gubernamentales. El sistema está diseñado para simplificar el proceso de reservación y administración de citas mediante el uso de Java para el manejo logico de la aplicación, JSP combinado con HTML y CSS para crear una interfaz grafica para el usuario y finamente JPA para poder lograr la integrándose con una base de datos MySQL
## Funcionalidades
- **Reservar Citas**: El superusuario puede crear citas de los ciudadano para diversos trámites.
- **Gestor de Ciudadanos**: Permite registrar y administrar información de los ciudadanos.
- **Trámites Disponibles**: Lista y gestiona los diferentes trámites gubernamentales.
- **Estado de Citas**: Visualización y actualización del estado de las citas (en espera, atendida).
## Clases Principales

- **Ciudadano**: Representa a un ciudadano con información como nombre, apellidos, CURP (Clave Única de Registro de Población) y teléfono.
- **Tramite**: Define un trámite disponible con nombre y descripción.
- **Usuario**: Administra la información de los usuarios del sistema, como correo y contraseña.
- **Cita**: Representa una cita con fecha, hora, estado y las relaciones correspondientes.

## Métodos Principales

### En las Entidades:

- **getters y setters**: Acceso y modificación de propiedades.

### En los Servlets:

- **doPost()**: Procesa las solicitudes POST para crear o actualizar datos.
- **doGet()**: Procesa las solicitudes GET para listar o recuperar datos.

## Requisitos

- Java 17 o superior
- Maven
- Servidor Apache Tomcat 
- MySQL 
- Navegador Web compatible

## Imagenes
### Interfaz de la pagina principal
![Imagen del repositorio](https://github.com/OmarGR203/GuzmanOmar_pruebatec2/blob/master/Index.png)
### Interfaz de la gestión de tramites
![Imagen del repositorio](https://github.com/OmarGR203/GuzmanOmar_pruebatec2/blob/master/Gestion%20de%20tramites.png)

## Supuestos

- Hasta el momento solo se cuenta con un único superusuario para la gestión de todo el sistema.
- Los trámites disponibles son definidos previamente por un administrador.
- El estado inicial de cada cita es "En espera" al ser creada.
- El número de cita se considero como el id general.
- El superusurio debe de registar con anterioridad al ciudadano y/o tramite.
- Al crear la cita el superusuario cuenta y escribe correctamente el nombre del tramite y el curp del ciudadano.
  
## Contraseñas de prueba
- Superusuario:
  **Email:** admin@hackaboss.com
  **Contraseña:** 123
- TomCat:
**Usuario:** admin
**Contraseña:** 123

## Diagramas

### Diagrama de Clases
![Imagen del repositorio](https://github.com/OmarGR203/GuzmanOmar_pruebatec2/blob/master/Diagrama%20de%20Clases%20Gestor%20de%20Citas%20Gubernamentales.png)

## Contacto
Email: oguzma20@gmail.com
