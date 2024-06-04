import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _favorite = prefs.getStringList('ff_favorite') ?? _favorite;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _favorite = [];
  List<String> get favorite => _favorite;
  set favorite(List<String> value) {
    _favorite = value;
    prefs.setStringList('ff_favorite', value);
  }

  void addToFavorite(String value) {
    _favorite.add(value);
    prefs.setStringList('ff_favorite', _favorite);
  }

  void removeFromFavorite(String value) {
    _favorite.remove(value);
    prefs.setStringList('ff_favorite', _favorite);
  }

  void removeAtIndexFromFavorite(int index) {
    _favorite.removeAt(index);
    prefs.setStringList('ff_favorite', _favorite);
  }

  void updateFavoriteAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _favorite[index] = updateFn(_favorite[index]);
    prefs.setStringList('ff_favorite', _favorite);
  }

  void insertAtIndexInFavorite(int index, String value) {
    _favorite.insert(index, value);
    prefs.setStringList('ff_favorite', _favorite);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
