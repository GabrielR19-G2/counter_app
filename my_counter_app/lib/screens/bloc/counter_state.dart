import 'package:flutter/material.dart';

enum CounterStatus { loading, success, error, initial }

class CounterState {
  const CounterState({
    this.status = CounterStatus.initial,
    this.counterValue = 0,
    this.ledColor = Colors.white,
  });

  final CounterStatus status;
  final int counterValue;
  final Color ledColor;

  CounterState copyWith({
    CounterStatus? status,
    int? counterValue,
    Color? ledColor,
  }) {
    return CounterState(
      status: status ?? this.status,
      counterValue: counterValue ?? this.counterValue,
      ledColor: ledColor ?? this.ledColor,
    );
  }
}
