abstract class CounterEvent {}

///IncrementCounter: Evento que aumenta el valor del contador.
class IncrementCounter extends CounterEvent {
  IncrementCounter(this.currentValue);
  int currentValue;
}

///Evento que disminuye el valor del contador.
class DecrementCounter extends CounterEvent {
  DecrementCounter(this.currentValue);
  int currentValue;
}

///Evento utilizado para reiniciar el contador.
class ResetCounter extends CounterEvent {}
