import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

final counterProvider = StateProvider((ref) => 0);

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Example'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, watch, _) {
            final count = watch(counterProvider).state;
            return Text('$count');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => watch(counterProvider).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
