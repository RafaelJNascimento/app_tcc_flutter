import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc_app/components/establishment_item.dart';
import '../provider/establishments.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Establishments establishments = Provider.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: establishments.count,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, i) => EstablishmentsItem(
          establishment: establishments.byIndex(i),
        ),
      ),
    );
  }
}
