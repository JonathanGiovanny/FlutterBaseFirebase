import 'package:crud_test/com/flutter/model/Item.dart';

class AddItemAction {
  final Item item;

  AddItemAction(this.item);
}

class ToggleItemStateAction {
  final Item item;

  ToggleItemStateAction(this.item);
}
