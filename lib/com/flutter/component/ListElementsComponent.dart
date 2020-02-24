import 'package:flutter/material.dart';

class ListElementsComponent extends StatelessWidget {
  final String title;
  final elements = const [
    {'title': 'Data', 'description': 'Message for something'},
    {'title': 'Bestie', 'description': 'Element number 2'},
    {'title': 'It\'s da best', 'description': 'Buy this thing'},
    {'title': 'Yadayada', 'description': 'It\' meMario'},
  ];

  ListElementsComponent({Key key, this.title}) : super(key: key);

  /// This method is rerun every time setState is called
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: ListView.builder(
          itemCount: elements.length,
          itemBuilder: (context, index) {
            var element = elements[index];
            return ListTile(
              leading:
                  CircleAvatar(child: Text(element['title'].substring(0, 1))),
              title: Text(element['title']),
              subtitle: Text(element['description']),
            );
          }),
    );
  }
}
