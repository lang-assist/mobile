import 'dart:typed_data';

import 'package:assist_utils/assist_utils.dart';
import 'package:flutter/material.dart';

class ItemPicture extends StatefulWidget {
  const ItemPicture({super.key, required this.pictureId});

  final String pictureId;

  @override
  State<ItemPicture> createState() => _ItemPictureState();
}

class _ItemPictureState extends State<ItemPicture> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: FadeInImage(
        placeholderErrorBuilder: (context, error, stackTrace) {
          return const Center(child: CircularProgressIndicator.adaptive());
        },
        fit: BoxFit.cover,
        image: itemPictureProvider(widget.pictureId),
        placeholder: MemoryImage(Uint8List(0)),
      ),
    );
  }
}
