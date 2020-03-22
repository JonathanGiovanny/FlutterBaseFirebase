import 'package:flutter/material.dart';

class Relevance {
  final int _value;
  final Color _color;

  const Relevance._internal(this._value, this._color);

  static const LEVEL_HIGH = const Relevance._internal(100, Colors.red);
  static const LEVEL_MEDIUM = const Relevance._internal(50, Colors.yellow);
  static const LEVEL_LOW = const Relevance._internal(10, Colors.green);

  int get getValue => _value;
  Color get getColor => _color;

  @override
  toString() => 'Relevance.($_value _ $_color)';
}
