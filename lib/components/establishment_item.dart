import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:tcc_app/models/establishment.dart';

class EstablishmentsItem extends StatelessWidget {
  final Establishment establishment;
  const EstablishmentsItem({
    super.key,
    required this.establishment,
  });

  @override
  Widget build(BuildContext context) {
    String base64String = establishment.img;

    Uint8List? bytes = Uri.parse(base64String).data?.contentAsBytes();
    return ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.memory(
              bytes!,
              height: 90,
              fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.only(left: 5.0),
              child: Text(
                establishment.name,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ));
  }
}
