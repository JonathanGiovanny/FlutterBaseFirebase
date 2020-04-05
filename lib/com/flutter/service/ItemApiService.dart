import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference _itemCollection =
    Firestore.instance.collection('todo-item');
