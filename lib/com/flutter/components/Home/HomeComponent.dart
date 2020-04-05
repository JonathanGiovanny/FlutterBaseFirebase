import 'package:crud_test/com/flutter/components/Home/ListComponent.dart';
import 'package:crud_test/com/flutter/util/Constants.dart';
import 'package:flutter/material.dart';

class HomeComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Build- HomeComponent");
    return Scaffold(
      backgroundColor: Constants.BG_COLOR,
      appBar: appBar,
      body: ListComponent(),
      floatingActionButton: floatingButton(context),
    );
  }

  final appBar = AppBar(
    centerTitle: true,
    title: Text('TODO List'),
    elevation: 0.1,
    backgroundColor: Constants.BG_COLOR,
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
      )
    ],
  );

  floatingButton(BuildContext context) => FloatingActionButton(
      backgroundColor: Colors.greenAccent,
      child: Icon(
        Icons.add,
        color: Constants.BG_COLOR,
        size: 30,
      ),
      onPressed: () {
        Navigator.of(context).pushNamed('/create-element');
      });
}
