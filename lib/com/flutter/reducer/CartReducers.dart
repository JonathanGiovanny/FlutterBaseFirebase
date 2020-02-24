import 'package:crud_test/com/flutter/action/cartActions.dart';
import 'package:crud_test/com/flutter/state/AppState.dart';

ItemState addItem(ItemState itemState, AddItemAction action) {
  return ItemState(List.from(itemState.items)..add(action.item));
}

ItemState toggleItemState(ItemState itemState, ToggleItemStateAction action) {
  return ItemState(itemState.items
      .map((item) => item.id == action.item.id ? action.item : item)
      .toList());
}
