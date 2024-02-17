import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample/counter.dart';
import 'package:sample/random_color.dart';


void main() {
  runApp(const ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  MyHomePage(),
    );
  }
}


class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counter = ref.watch(counterProvider);
    final Color color = ref.watch(randomColorProvider);

    return Scaffold(
      appBar: AppBar(
       ),
      body: const Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
              CounterText(),
          ],
        ),
      ),
      floatingActionButton:  const Buttons(),
    );
  }
}

class CounterText extends ConsumerWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counter = ref.watch(counterProvider);
    final Color color = ref.watch(randomColorProvider);

    return Text(
      '$counter',
      style: TextStyle(color: color, fontSize: 64),
    );
  }
}

class Buttons extends ConsumerWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){
              ref.read(randomColorProvider.notifier).randomColor();
            },
            child: const Icon(Icons.color_lens),
          ),
          FloatingActionButton(
            onPressed: (){
              ref.read(counterProvider.notifier).resetCounter();
            },
            child: const Icon(Icons.exposure_zero),
          ),
          FloatingActionButton(
            onPressed: (){
              ref.read(counterProvider.notifier).decrementCounter();
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: (){
              ref.read(counterProvider.notifier).incrementCounter();
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: (){
              ref.read(counterProvider.notifier).multiplyCounter();
            },
            child: const Icon(Icons.close),
          ),
        ],
      );
  }
}