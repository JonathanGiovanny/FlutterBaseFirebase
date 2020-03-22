import 'package:crud_test/com/flutter/model/Item.dart';

class AddItemAction {
  final Item item;

  AddItemAction(this.item);
}

class ReorderItemAction {
  final int oldIndex;
  final int newIndex;

  ReorderItemAction(this.oldIndex, this.newIndex);
}

class DeleteItemAction {
  final int position;

  DeleteItemAction(this.position);
}
