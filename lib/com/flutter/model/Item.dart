import 'package:crud_test/com/flutter/model/RelevanceEnum.dart';
import 'package:flutter/widgets.dart';

class Item {
  int id;
  String name;
  String description;
  Relevance relevance;

  Item(
      {this.id,
      @required this.name,
      @required this.description,
      this.relevance});

  @override
  String toString() {
    return 'Item {id: $id, name: $name, description: $description, relevance: $relevance}';
  }

  factory Item.fromJson(Map<String, dynamic> json) => Item(
      id: json['id'], name: json['name'], description: json['description']);
}
