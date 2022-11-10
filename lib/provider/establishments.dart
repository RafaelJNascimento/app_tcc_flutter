import 'package:flutter/material.dart';
import 'package:tcc_app/data/dummy_establishments.dart';
import 'package:tcc_app/models/establishment.dart';

class Establishments with ChangeNotifier {
  final Map<String, Establishment> _items = {...dummyESTABLISHMENTS};

  List<Establishment> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Establishment byIndex(int i) {
    return _items.values.elementAt(i);
  }
}
