import 'package:crud_test/com/flutter/component/components.dart';
import 'package:crud_test/com/flutter/model/models.dart';
import 'package:crud_test/com/flutter/reducer/AppReducers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class MyApp extends StatelessWidget {
  final Store<AppState> createStore = Store<AppState>(
    appStateReducers,
    initialState: AppState.initialState(),
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: createStore,
      child: MaterialApp(
        title: 'MyApp Demo',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
        ),
        home: HomeComponent(),
        routes: {'/create-element': (context) => CreateElementComponent()},
      ),
    );
  }
}
