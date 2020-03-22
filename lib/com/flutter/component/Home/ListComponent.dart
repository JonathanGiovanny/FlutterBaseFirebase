import 'package:crud_test/com/flutter/action/actions.dart';
import 'package:crud_test/com/flutter/model/RelevanceEnum.dart';
import 'package:crud_test/com/flutter/model/models.dart';
import 'package:crud_test/com/flutter/util/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ListComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => store.state.items,
      builder: (BuildContext context, List<Item> items) {
        return items.isEmpty
            ? buildEmptyMessage
            : buildListComponent(items, context);
      },
    );
  }

  final buildEmptyMessage = Center(
    child: Text(
      'There are no elements in the list',
      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
    ),
  );

  buildListComponent(List<Item> items, BuildContext context) {
    return ReorderableListView(
      children: items
          .asMap()
          .entries
          .map((entry) => buildDismissable(context, entry.key, entry.value))
          .toList(),
      onReorder: (oldIndex, newIndex) =>
          updateMyItems(context, oldIndex, newIndex),
    );
  }

  Widget buildDismissable(BuildContext context, int position, Item item) =>
      Dismissible(
        key: Key(item.hashCode.toString()),
        child: buildRow(item),
        background: Container(
          color: Colors.grey,
          child: deleteBackground,
          alignment: Alignment(-0.1, 0),
        ),
        onDismissed: (direction) => deleteItem(context, position),
      );

  final deleteBackground = Row(
    children: <Widget>[
      Container(
        padding: EdgeInsets.only(left: 10, right: 5),
        child: Icon(
          Icons.delete,
          color: Constants.BG_COLOR,
        ),
      ),
      Text(
        'Delete',
        style: TextStyle(color: Constants.BG_COLOR),
      )
    ],
  );

  Widget buildRow(Item item) {
    final listTileElement = ExpansionTile(
      leading: buildLeading(item.relevance),
      title: Text(
        item.name,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: buildRowContent(item.description),
      ),
      children: buildExpansionCard(item.description),
    );

    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(64, 75, 96, .9),
        ),
        child: listTileElement,
      ),
    );
  }

  buildLeading(Relevance level) => Container(
        width: 50,
        padding: EdgeInsets.only(top: 6.0, right: 12.0, bottom: 6.0),
        decoration: new BoxDecoration(
          border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white24)),
        ),
        child: Center(
          child: FAProgressBar(
            direction: Axis.vertical,
            verticalDirection: VerticalDirection.up,
            borderRadius: 0,
            progressColor: level.getColor,
            currentValue: level.getValue,
          ),
        ),
      );

  List<Widget> buildRowContent(String description) => [
        Container(
          padding: EdgeInsets.only(right: 5),
          child: Icon(
            Icons.fiber_manual_record,
            color: Colors.yellowAccent,
            size: 15,
          ),
        ),
        Container(
          width: 200,
          child: Text(
            description,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white),
          ),
        )
      ];

  List<Widget> buildExpansionCard(String description) => [
        Container(
          padding: EdgeInsets.only(left: 12.0, bottom: 6.0),
          child: Text(
            description,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ];

  void updateMyItems(BuildContext context, int oldIndex, int newIndex) =>
      StoreProvider.of<AppState>(context).dispatch(
        ReorderItemAction(oldIndex, newIndex),
      );

  void deleteItem(BuildContext context, int position) =>
      StoreProvider.of<AppState>(context).dispatch(
        DeleteItemAction(position),
      );
}
