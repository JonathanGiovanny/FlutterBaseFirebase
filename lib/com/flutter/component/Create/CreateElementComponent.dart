import 'package:crud_test/com/flutter/action/actions.dart';
import 'package:crud_test/com/flutter/model/models.dart';
import 'package:crud_test/com/flutter/util/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CreateElementComponent extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: appBar(context),
        body: createComponent(),
        backgroundColor: Constants.BG_COLOR,
      ),
      onWillPop: () => backAction(context),
    );
  }

  appBar(context) => AppBar(
      title: Text(
        'Create note',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontFamily: 'Roboto',
          fontSize: 18,
          height: 2,
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.keyboard_arrow_left, color: Colors.white, size: 30.0),
        onPressed: () {
          backAction(context);
        },
      ),
      elevation: 0.1);

  createComponent() => Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(12),
          child: createForm(),
        ),
      );

  createForm() => Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Title'),
            style: TextStyle(color: Colors.white, fontSize: 16),
            controller: _titleController,
            validator: (value) {
              /*if (value.isEmpty) {
              return 'Please enter some text';
            }*/
              return null;
            },
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Description',
                filled: true,
              ),
              style: TextStyle(color: Colors.white, fontSize: 16),
              controller: _descriptionController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              validator: (value) {
                /*if (value.isEmpty) {
              return 'Please enter some text';
            }*/
                return null;
              },
            ),
          ),
        ],
      );

  final createComponent2 = DefaultTextStyle.merge(
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18,
      height: 2,
    ),
    child: Container(
      padding: EdgeInsets.all(20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Column(
          children: [
            Icon(Icons.kitchen, color: Colors.green[500]),
            Text('PREP:'),
            Text('25 min'),
          ],
        ),
      ]),
    ),
  );

  backAction(context) {
    StoreProvider.of<AppState>(context).dispatch(
      AddItemAction(
        Item(
          name: _titleController.value.text,
          description: _descriptionController.value.text,
        ),
      ),
    );
    Navigator.pop(context);
  }
}
