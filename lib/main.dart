import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hello_hooks/managers/dialog_manager.dart';
import 'package:hello_hooks/services/dialog_service.dart';
import 'package:hello_hooks/ui/home_view.dart';
import 'package:hello_hooks/viewModels/home_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final dialogServiceProvider = Provider((ref) => DialogService());
final homeViewModelProvider = Provider((ref) => HomeViewModel(ref));

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: (context, widget) => Navigator(
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(
                  child: widget,
                )),
      ),
      home: HomeView(),
    );
  }
}
