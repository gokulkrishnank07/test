import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/product_list_screen/bloc/product_detials/product_bloc.dart';
import 'package:machine_test/product_list_screen/bloc/product_detials/product_event.dart';
import 'package:machine_test/product_list_screen/product_listscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marketplace',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (BuildContext context) => ProductBloc(),

        child: ProductListScreen(),
      ),
      

    );
  }
}
