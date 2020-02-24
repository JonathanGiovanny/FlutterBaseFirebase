import 'package:crud_test/com/flutter/action/AppActions.dart';
import 'package:crud_test/com/flutter/reducer/CartReducers.dart';
import 'package:crud_test/com/flutter/state/AppState.dart';

AppState appReducers(AppState items, dynamic action) {
  switch (action) {
    case Actions.AddItemAction:
      return addItem(items, action);
    case Actions.ToggleItemStateAction:
      return toggleItemState(items, action);
  }

  return items;
}
