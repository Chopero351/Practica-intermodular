💻 Programación
● Implementar las clases necesarias con relaciones entre ellas (POO), por ejemplo:
Categoria, EntidadPrincipal, EntidadSecundaria, SistemaInformativo,
etc.
● Crear una clase DataBaseManager.java que se encargue de conectar a la base de
datos, leer los datos y generar los objetos correspondientes.
● Crear una clase Main.java que muestre un menú interactivo que permita al
usuario:
○ Ver los datos del elemento raíz (categoría o entidad principal).
○ Ver una lista de entidades principales, seleccionar una y consultar sus datos,
incluyendo los elementos relacionados.
○ Ver una lista de entidades secundarias, seleccionar una y consultar sus datos,
incluyendo a qué entidad principal pertenece.
● Toda la información se cargará en memoria (en objetos y listas de objetos) al iniciar
el programa (no se harán consultas bajo demanda).
● El programa debe controlar todas las excepciones posibles, sin romperse. Tras
cualquier error, se debe mostrar un mensaje y volver al menú principal.
● Estructura orientativa:
├── Main.java
├── DataBaseManager.java
├── SistemaInformativo.java
├── EntidadPrincipal.java
├── EntidadSecundaria.java
├── Categoria.java (u otra clase raíz)
