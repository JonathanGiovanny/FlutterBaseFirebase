import 'package:crud_test/com/flutter/reducer/ItemReducer.dart';
import 'package:crud_test/com/flutter/model/models.dart';

AppState appStateReducers(AppState state, dynamic action) {
  return AppState(items: itemsReducer(state.items, action));
}
