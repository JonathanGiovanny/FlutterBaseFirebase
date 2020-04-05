import 'package:crud_test/com/flutter/components/components.dart';
import 'package:crud_test/com/flutter/model/models.dart';
import 'package:crud_test/com/flutter/reducer/AppReducers.dart';
import 'package:crud_test/com/flutter/util/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class MyApp extends StatelessWidget {
  final Store<AppState> _createStore = Store<AppState>(
    appStateReducers,
    initialState: AppState.initialState(),
    middleware: [thunkMiddleware],
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: _createStore,
      child: MaterialApp(
        title: 'MyApp Demo',
        theme: _buildTheme(),
        home: HomeComponent(),
        routes: {'/create-element': (context) => CreateElementComponent()},
      ),
    );
  }

  ThemeData _buildTheme() => ThemeData(
        primaryColor: Constants.BG_COLOR,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: Colors.white,
          ),
        ),
      );
}
