import 'package:crud_test/com/flutter/model/RelevanceEnum.dart';
import 'package:crud_test/com/flutter/model/models.dart';

class ItemService {
  static final ItemService _instance = ItemService._internal();

  factory ItemService() {
    return _instance;
  }

  ItemService._internal();

  List<Item> addItem(List<Item> existingItems, Item newItem) {
    if (canNotBeSaved(newItem)) {
      return existingItems;
    } else {
      List<Item> items = List.from(existingItems)..add(newItem);
      return _recalculateRelevance(items);
    }
  }

  bool canNotBeSaved(Item item) {
    return (item.name == null || item.name.isEmpty) &&
        (item.description == null || item.description.isEmpty);
  }

  List<Item> reorderItem(List<Item> existingItems, int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    var items = List<Item>.from(existingItems);
    final Item item = removeItem(items, oldIndex);
    items.insert(newIndex, item);
    return _recalculateRelevance(items);
  }

  List<Item> deleteItem(List<Item> existingItems, int pos) {
    var items = List<Item>.from(existingItems);
    removeItem(items, pos);
    return _recalculateRelevance(items);
  }

  Item removeItem(List<Item> items, int pos) => items.removeAt(pos);

  List<Item> _recalculateRelevance(List<Item> items) {
    return Iterable<int>.generate(items.length)
        .map((index) => Item(
            id: items[index].id,
            name: items[index].name,
            description: items[index].description,
            relevance: _calculateRelevance(index)))
        .toList();
  }

  Relevance _calculateRelevance(int index) {
    if ((index + 1) <= 3) {
      return Relevance.LEVEL_HIGH;
    } else if ((index + 1) <= 9) {
      return Relevance.LEVEL_MEDIUM;
    } else {
      return Relevance.LEVEL_LOW;
    }
  }
}
