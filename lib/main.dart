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
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: TextStyle(color:color,fontSize: 64,)
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){
              final notifier = ref.read(randomColorProvider.notifier).randomColor();
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
