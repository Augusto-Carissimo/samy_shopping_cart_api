# SAMY Alliance business case: Shopping Cart API

### Instrucciones: 
```
clone git@github.com:Augusto-Carissimo/samy_shopping_cart_api.git
rails s
``` 
or
```
clone git@github.com:Augusto-Carissimo/samy_shopping_cart_api.git
sudo docker build samy_shopping_card_api .
sudo docker run -p 3000:3000 samy_shopping_card_api
```
### Implementacion:
* Para priorizar el tiempo del desarrollo decidi utilizar una implementacion REST (salvo por algun custom endpoints) y usar sqlite3.
* Utilice TDD (Test-driven development) para la implementacion, especialmente a la hora de diseñar el modelo de datos y sus validaciones.
* El schema esta compuesto por Products y Events que heredan de Items. Este ultimo tiene todos los atributos pedidos en el requerimiento.
* Los URL utilizan un diseño REST clasico salvo por el manejo de las cantidades de stock y productos en el carritos los cuales tienen custom endpoints (`config/routes.rb`)
* La gestion de errores tiene lugar en las validaciones de los modelos.
* La app esta dockerizada con `Dockerfile`.
* El estilo del las views/FE esta hecho con ChatGPT 3.5.

### Puntos flacos y mejoras.

* Agregar requests/controllers testing.
* Configuracion del Log para trackeo de errores.
* Creacion de users con Device gem.
* Asignacion de un Cart por User en vez de `cart = Cart.first_or_create` unico en la aplicacion.
* Thumbnails linkeados con Cloudinary para el display de imagenes de productos.



