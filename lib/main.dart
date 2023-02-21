import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Provider App',
      theme: ThemeData(primaryColor: Colors.blue),
      home: MyHomePage(),
    );
  }
}

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});
final helloWorld = Provider((ref) => 'Hello World');

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(counterStateProvider);
    final String valueTwo = ref.watch(helloWorld);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Value: $value',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(valueTwo)
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
          padding: EdgeInsets.only(left: 30),
          child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            FloatingActionButton(
                onPressed: () => ref.read(counterStateProvider.state).state++,
                child: Icon(Icons.add)),
            Expanded(child: Container()),
            FloatingActionButton(
              onPressed: () => ref.read(counterStateProvider.state).state--,
              child: Icon(Icons.remove),
            )
          ])),
    );
  }
}
