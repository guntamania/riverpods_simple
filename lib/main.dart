import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

// A Counter example implemented with riverpod

void main() {
  runApp(
    // Adding ProviderScope enables Riverpod for the entire project
    const ProviderScope(child: App()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

/// Providers are declared globally and specifies how to create a state
final counterProvider = StateProvider((ref) => 0);

// final counterProvider = StateNotifierProvider((ref) {
//   return Counter();
// });

class Counter extends StateNotifier<int> {
  Counter(): super(0);

  void increment() => state++;
}

class Home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter example')),
      body: Center(
        // Consumer is a widget that allows you reading providers.
        // You could also use the hook "ref.watch(" if you uses flutter_hooks
        child: Consumer(builder: (context, ref, _) {
          final count = ref.watch(counterProvider);
          return Text(count.toString());
        }),
      ),
      floatingActionButton: FloatingActionButton(
        // The read method is an utility to read a provider without listening to it
        onPressed: () => ref.read(counterProvider.state).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}