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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    Phone().readData;
    super.initState();
  }
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
          borderRadius: BorderRadius.circular(18),
          onTap: () {
            showModalBottomSheet(
                context: context, builder: (context) => const AddPhone());
          },
          child: Container(
            alignment: Alignment.center,
            height: 60,
            width:  200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.redAccent,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(10, 10),
                  blurRadius: 10,
                )
              ]
            ),
            child: Consumer(
              builder: ((context, ref, child) {
                final phoneNumber = ref.watch(nameProvider);
                return Text(phoneNumber?? 'Номер не задан',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.white
                ),);
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
