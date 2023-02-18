import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:want_go_home/pages/adding_phone.dart';

import 'models/phone.dart';

final nameProvider = StateProvider((ref) => Phone.phone);

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Хочу домой'),
      ),
      body: Center(
        child: InkWell(
          splashColor: Colors.red,
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            showModalBottomSheet(
                context: context, builder: (context) => const AddPhone());
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Consumer(
              builder: ((context, ref, child) {
                final phoneNumber = ref.watch(nameProvider);
                return Text(phoneNumber?? 'Номер не задан');
              }),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.phone),
      ),
    );
  }
}
