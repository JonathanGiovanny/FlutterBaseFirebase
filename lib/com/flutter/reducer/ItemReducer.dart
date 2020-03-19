import 'package:crud_test/com/flutter/action/CartActions.dart';
import 'package:crud_test/com/flutter/model/Item.dart';
import 'package:redux/redux.dart';

final Reducer<List<Item>> itemsReducer = combineReducers<List<Item>>([
  TypedReducer(addItem),
  TypedReducer(toggleItemState),
]);

List<Item> addItem(List<Item> itemState, AddItemAction action) {
  return List.from(itemState)..add(action.item);
}

List<Item> toggleItemState(List<Item> itemState, ToggleItemStateAction action) {
  return itemState
      .map((item) => item.id == action.item.id ? action.item : item)
      .toList();
}
