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
* Para priorizar el tiempo decidí utilizar una implementación REST (salvo por algún custom endpoints) y usar sqlite3.
* Utilice TDD (Test-driven development) para la implementación, especialmente a la hora de diseñar el modelo de datos y sus validaciones.
* El schema está compuesto por Products y Events que heredan de Items. Este último tiene todos los atributos pedidos en el requerimiento.
* Los URL utilizan un diseño REST clásico salvo por el manejo de las cantidades de stock y productos en el carrito los cuales tienen custom endpoints. (`config/routes.rb`)
* La gestión de errores tiene lugar en las validaciones de los modelos.
* La app está dockerizada con `Dockerfile`.
* El estilo de las views/FE está hecho con ChatGPT 3.5.

### Puntos flacos y mejoras.

* Configuración del Log para trackeo de errores.
* Trackeo de clicks al intentar agregar items al carrito sin stock y sumar cantidad de items al carrito cuando no queda stock. Info relevante para saber qué productos son los más solicitados más allá de las ventas limitadas por el stock.
* Creación de users con Device gem.
* Asignación de un Cart por User en vez de `cart = Cart.first_or_create` único en la aplicación.
* Thumbnails linkeados con Cloudinary para el display de imágenes de productos.

### Gems utilizadas

* rubocop
* rspec
* factory_bot_rails
* faker

Ruby 3.2.2