import 'package:flutter/foundation.dart';

class BaseViewModel extends ChangeNotifier {
  bool loading = false;

  void isLoading(bool val) {
    loading = val;
    notifyListeners();
  }
}
