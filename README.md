# Pasteleros objetos

## TP Individual

### Consigna: https://docs.google.com/document/d/1f81DK-oblXdKjqoBGFKBAVOlVOz2fgjUDTgJqR3mHsU/edit?usp=sharing

## Usos del polimorfismo

Durante el desarrollo del programa se pueden observar distintos tipos de polimorfismo, como por ejemplo el método nivelDeHabilidad() que es polimorfico a todos los concursantes, o tambien que todos respondan al metodo puedePrepararSuPostreFavorito().
Para que se puedan manejar de forma polimorfica, el objeto o los objetos unicamente deben saber responder al envio de esos mensajes. Es decir debe haber un metodo declarado dentro del código del objeto.

La ventaja del uso de clases en este caso es que cuando varios objetos se comportan igual puedo crear una especie de molde que los represente.
Hay casos en los que se justifica su uso, como en la clase Ingrediente, ya que todos se comportan de manera igual, pero si hablamos de los pasteleros, no es conveniente hacer una clase ya que si bien tienen metodos iguales como los mencionados arriba, hay otros métodos que solo corresponden a un objeto particular como el metodo tieneSuficiente() de marcos.
