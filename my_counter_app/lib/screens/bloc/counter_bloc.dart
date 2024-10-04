import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_counter_app/screens/bloc/counter_event.dart';
import 'package:my_counter_app/screens/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementCounter>(onIncrementCounter);
    on<DecrementCounter>(onDecrementCounter);
    on<ResetCounter>(onResetCounter);
  }

  void onIncrementCounter(
      IncrementCounter event, Emitter<CounterState> emit) async {
    try {
      emit(state.copyWith(
          status: CounterStatus.loading, ledColor: Colors.green));
      // 2 ej
      var currentV = event.currentValue;
      currentV += 1;
      print('Valor actual: ${currentV}');
      await Future.delayed(Duration(milliseconds: 300));
      print('Cambia color: ${state.ledColor}');
      emit(state.copyWith(
          status: CounterStatus.success,
          counterValue: currentV,
          ledColor: Colors.white));
    } catch (error) {
      print('[IncrementCounter]: $error');
      emit(state.copyWith(status: CounterStatus.error));
    }
  }

  void onDecrementCounter(
      DecrementCounter event, Emitter<CounterState> emit) async {
    try {
      emit(state.copyWith(status: CounterStatus.loading, ledColor: Colors.red));
      var currentV = event.currentValue;
      currentV -= 1;
      await Future.delayed(Duration(milliseconds: 300));
      emit(state.copyWith(
          status: CounterStatus.success,
          counterValue: currentV,
          ledColor: Colors.white));
    } catch (error) {
      print('[DecrementCounter]: $error');
      emit(state.copyWith(status: CounterStatus.error));
    }
  }

  void onResetCounter(ResetCounter event, Emitter<CounterState> emit) async {
    try {
      emit(state.copyWith(
          status: CounterStatus.loading, ledColor: Colors.amber));
      await Future.delayed(Duration(milliseconds: 300));
      emit(state.copyWith(
          status: CounterStatus.success,
          ledColor: Colors.white,
          counterValue: 0));
    } catch (error) {
      print('[ResetCounter]: $error');
      emit(state.copyWith(status: CounterStatus.error));
    }
  }
}
