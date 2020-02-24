import 'package:crud_test/com/flutter/model/Item.dart';

abstract class AppState {}

class ItemState implements AppState {
  final List<Item> items;

  ItemState(this.items);
}
