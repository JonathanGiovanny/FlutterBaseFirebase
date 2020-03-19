import 'package:crud_test/com/flutter/model/Item.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final List<Item> items;

  AppState({
    @required this.items,
  });

  //AppState.initialState() : items = List.unmodifiable([]);
  AppState.initialState()
      : items = [
          Item(name: 'Data', description: 'Message for something'),
          Item(name: 'DaBestieta', description: 'Element number 2'),
          Item(name: 'It\'s da best', description: 'Buy this thing'),
          Item(name: 'Yadayada', description: 'It\'s meMario'),
        ];

  @override
  String toString() {
    return 'AppState: {items: $items}';
  }
}
