import 'package:crud_test/com/flutter/component/components.dart';
import 'package:crud_test/com/flutter/model/models.dart';
import 'package:crud_test/com/flutter/reducer/AppReducers.dart';
import 'package:crud_test/com/flutter/util/Constants.dart';
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
        darkTheme: ThemeData.dark(),
        theme: ThemeData(
          primaryColor: Constants.BG_COLOR,
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        home: HomeComponent(),
        routes: {'/create-element': (context) => CreateElementComponent()},
      ),
    );
  }
}
