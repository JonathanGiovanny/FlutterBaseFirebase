import 'package:crud_test/com/flutter/state/AppState.dart';
import 'MyApp.dart';
import 'package:flutter/material.dart';

void main() {
  final store = Store<AppState>();
  runApp(MyApp());
}
