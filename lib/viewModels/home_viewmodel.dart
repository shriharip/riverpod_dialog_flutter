import 'package:hello_hooks/main.dart';
import 'package:hello_hooks/services/dialog_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeViewModel {
  final ProviderReference _ref;
  DialogService _dialogService;
  HomeViewModel(this._ref) {
    _dialogService = _ref.read(dialogServiceProvider).value;
  }

  Future doThings() async {
    print('dialog shown');
    var dialogResult = await _dialogService.showDialog(
        title: 'Darttingg', description: 'Flutter is always awesome');

    if (dialogResult.confirmed) {
      print('User has confirmed');
    } else {
      print('User cancelled the dialog');
    }
  }
}
