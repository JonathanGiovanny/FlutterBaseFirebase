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
        appBar: _appBar(context),
        body: _createComponent(),
        backgroundColor: Constants.BG_COLOR,
      ),
      onWillPop: () => _backAction(context),
    );
  }

  _appBar(context) => AppBar(
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
          _backAction(context);
        },
      ),
      elevation: 0.1);

  _createComponent() => Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(12),
          child: _createForm(),
        ),
      );

  _createForm() => Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Title'),
            style: TextStyle(color: Colors.white, fontSize: 16),
            controller: _titleController,
            validator: _formValidator,
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Description',
              filled: true,
            ),
            style: TextStyle(color: Colors.white, fontSize: 16),
            controller: _descriptionController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            validator: _formValidator,
          ),
        ],
      );

  _backAction(context) {
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

  String _formValidator(String value) {
    /*if (value.isEmpty) {
      return 'Please enter some text';
    }*/
    return null;
  }
}
