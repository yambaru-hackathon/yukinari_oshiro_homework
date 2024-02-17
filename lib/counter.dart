import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter.g.dart';

@riverpod
class Counter extends _$Counter {
    @override
    int build() => 0;

  void incrementCounter() {
    state++;
  }

  void decrementCounter() {
    state--;
  }

  void resetCounter(){
    state = 0;
  }

  void multiplyCounter(){
    state *= state;
  }
}