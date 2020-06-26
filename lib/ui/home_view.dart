import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hello_hooks/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final model = useProvider(homeViewModelProvider);

    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('Show Dialog'),
          onPressed: () {
            model.doThings();
          },
        ),
      ),
    );
  }
}
