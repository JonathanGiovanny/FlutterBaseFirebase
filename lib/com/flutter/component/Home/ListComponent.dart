import 'package:crud_test/com/flutter/model/models.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ListComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => store.state.items,
      builder: (BuildContext context, List<Item> items) {
        return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return buildRow(items[index]);
            });
      },
    );
  }

  buildRow(Item item) {
    final listTileElement = ListTile(
      leading: buildLeading(),
      title: Text(
        item.name,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 5),
            child: Icon(Icons.linear_scale, color: Colors.yellowAccent),
          ),
          Text(item.description, style: TextStyle(color: Colors.white))
        ],
      ),
      trailing: buildTrailing(),
    );

    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: listTileElement,
      ),
    );
  }

  buildLeading() {
    return Container(
      padding: EdgeInsets.only(top: 6.0, right: 12.0, bottom: 6.0),
      decoration: new BoxDecoration(
          border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white24))),
      child: Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
    );
  }

  buildTrailing() {
    return Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0);
  }
}
