import 'package:crud_test/com/flutter/action/actions.dart';
import 'package:crud_test/com/flutter/model/models.dart';
import 'package:crud_test/com/flutter/service/services.dart';
import 'package:redux/redux.dart';

final Reducer<List<Item>> itemsReducer = combineReducers<List<Item>>([
  TypedReducer(addItem),
  TypedReducer(reorderItem),
  TypedReducer(deleteItem),
]);

List<Item> addItem(List<Item> itemState, AddItemAction action) =>
    ItemService().addItem(itemState, action.item);

List<Item> reorderItem(List<Item> itemState, ReorderItemAction action) =>
    ItemService().reorderItem(itemState, action.oldIndex, action.newIndex);

List<Item> deleteItem(List<Item> itemState, DeleteItemAction action) =>
    ItemService().deleteItem(itemState, action.position);
