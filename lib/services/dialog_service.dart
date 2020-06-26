import 'dart:async';

import 'package:hello_hooks/dataModels/request_response.dart';

class DialogService {
  Function(AlertRequest) _showDialogListener;
  Completer<AlertResponse> _dialogCompleter;

  void registerDialogListener(Function(AlertRequest) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  Future<AlertResponse> showDialog(
      {String title, String description, String buttonTitle = 'OK'}) {
    _dialogCompleter = Completer<AlertResponse>();
    _showDialogListener(AlertRequest(
      title: title,
      description: description,
      buttonTitle: buttonTitle,
    ));
    return _dialogCompleter.future;
  }

  void dialogComplete(AlertResponse response) {
    _dialogCompleter.complete(response);
    _dialogCompleter = null;
  }
}
