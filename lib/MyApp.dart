import 'package:crud_test/com/flutter/component/ListElementsComponent.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ListElementsComponent(title: 'Flutter Demo Home Page'),
    );
  }
}
