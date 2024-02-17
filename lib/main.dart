import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/count_model.dart';
import 'package:sample/count_del.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountModel()),
          ChangeNotifierProvider(create: (_) => CountDel()),
        ],
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('カウンター'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CountBody(),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              final model = context.read<CountDel>();
              model.decrementCounter();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          SizedBox(height: 16), // ボタン間の間隔を空けるためのSizedBox
          FloatingActionButton(
            onPressed: () {
              final model = context.read<CountModel>();
              model.incrementCounter();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class CountBody extends StatelessWidget {
  const CountBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countModel = context.watch<CountModel>();
    final countDel = context.watch<CountDel>();

    return Column(
      children: [
        Text(
          'プラスカウンター: ${countModel.counter}',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(height: 20), // ボタン間の間隔を空けるためのSizedBox
        Text(
          'マイナスカウンター: ${countDel.counter}',
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}
