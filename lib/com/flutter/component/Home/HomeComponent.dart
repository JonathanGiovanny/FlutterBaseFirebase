import 'package:crud_test/com/flutter/component/Home/ListComponent.dart';
import 'package:flutter/material.dart';

class HomeComponent extends StatelessWidget {
  /// This method is rerun every time setState is called
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: appBar,
      body: ListComponent(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, '/create-element');
          }),
    );
  }

  final appBar = AppBar(
    centerTitle: true,
    title: Text('TODO List'),
    elevation: 0.1,
    backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
      )
    ],
  );
}
