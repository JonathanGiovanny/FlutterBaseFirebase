import 'package:crud_test/com/flutter/model/Item.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final List<Item> items;

  AppState({
    @required this.items,
  });

  AppState.initialState() : items = List.unmodifiable([]);

  @override
  String toString() {
    return 'AppState: {items: $items}';
  }
}
