import 'package:flutter/material.dart';
import 'package:hello_hooks/dataModels/request_response.dart';
import 'package:hello_hooks/main.dart';
import 'package:hello_hooks/services/dialog_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DialogManager extends StatefulWidget {
  final Widget child;
  DialogManager({Key key, this.child}) : super(key: key);

  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService;

  // @override
  // void initState() {
  //   super.initState();
  //   _dialogService = widget.ref.read(dialogServiceProvider);
  //   _dialogService.registerDialogListener(_showDialog);
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer((context, read) {
      _dialogService = read(dialogServiceProvider);
      _dialogService.registerDialogListener(_showDialog);
      return widget.child;
    });
  }

  void _showDialog(AlertRequest request) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(request.title),
            content: Text(request.description),
            actions: [
              RaisedButton(
                child: Text('CANCEL'),
                onPressed: () {
                  _dialogService
                      .dialogComplete(AlertResponse(confirmed: false));
                  Navigator.of(context).pop();
                },
              ),
              RaisedButton(
                child: Text(request.buttonTitle),
                onPressed: () {
                  _dialogService.dialogComplete(AlertResponse(confirmed: true));
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
