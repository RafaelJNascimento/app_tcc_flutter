import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tcc_app/databases/db_firestore.dart';
import 'package:tcc_app/models/establishment.dart';

class Establishments with ChangeNotifier {
  final Map<String, Establishment> _items = {};
  late FirebaseFirestore db;

  Establishments() {
    _startRepository();
  }

  void _startRepository() async {
    await _startFirestore();
    await _readEstablishments();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  _readEstablishments() async {
    if (_items.isEmpty) {
      final snapshot = await db.collection('estabelecimentos').get();
      for (var doc in snapshot.docs) {
        _items.putIfAbsent(
            doc.id,
            () => Establishment(
                  img: doc.data()['img'],
                  name: doc.data()['nome'],
                ));
      }
    }
    notifyListeners();
  }

  List<Establishment> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Establishment byIndex(int i) {
    return _items.values.elementAt(i);
  }

  remove(String id) async {
    await db.collection('estabelecimentos').doc(id).delete();
    // remover da lista local
    notifyListeners();
  }
}
