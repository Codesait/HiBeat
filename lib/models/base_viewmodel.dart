import 'package:flutter/foundation.dart';

class BaseViewModel extends ChangeNotifier {
  bool loading = true;

  void isLoading(bool val) {
    loading = val;
    notifyListeners();
  }
}
