import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_weather_riverpod2/providers/providers.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

///
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('Material App Bar')),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: City.values.length,
                itemBuilder: (context, index) {
                  var currentCity = ref.watch(currentCityProvider);
                  var isSelected = currentCity == City.values[index];

                  return ListTile(
                    onTap: () {
                      ref.read(currentCityProvider.notifier).state =
                          City.values[index];
                    },
                    title: Text(
                      City.values[index].toString(),
                      style: const TextStyle(fontSize: 40),
                    ),
                    trailing: (isSelected) ? const Icon(Icons.check) : null,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
