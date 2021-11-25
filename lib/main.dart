import 'package:flutter/material.dart';
import 'package:netflix_clone/repositories/data_provider.dart';
import 'package:netflix_clone/repositories/index_provider.dart';
import 'package:netflix_clone/ui/screens/root.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => IndexProvider()),
        ChangeNotifierProvider(create: (_) => DataProvider()),
      ],
      builder: (context, child) => const MyApp(),
    ),
  );

  // runApp(
  //   ChangeNotifierProvider(
  //     create: (_) => IndexProvider(),
  //     child: const MyApp(),
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Root(),
    );
  }
}
