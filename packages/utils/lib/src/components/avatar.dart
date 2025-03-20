import 'package:api/api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

CachedNetworkImageProvider itemPictureProvider(String id) =>
    CachedNetworkImageProvider(
      "http://localhost:3000/storage/item-picture/$id",
    );

CachedNetworkImageProvider userPictureProvider(String id) =>
    CachedNetworkImageProvider(
      "http://localhost:3000/storage/user-picture/$id",
    );

class ImggenUserAvatar extends StatefulWidget {
  const ImggenUserAvatar({
    super.key,
    required this.avatar,
    this.size = 48.0,
    this.isHero = false,
  });

  final Avatar avatar;

  final double size;

  final bool isHero;

  @override
  State<ImggenUserAvatar> createState() => _ImggenUserAvatarState();
}

class _ImggenUserAvatarState extends State<ImggenUserAvatar> {
  @override
  Widget build(BuildContext context) {
    Widget child;

    if (widget.avatar.isData) {
      child = Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: MemoryImage(widget.avatar.data),
            fit: BoxFit.cover,
          ),
        ),
      );
    } else if (widget.avatar.isColors) {
      child = Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: widget.avatar.hslColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      );
    } else {
      child = Container(
        width: widget.size,
        height: widget.size,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10000),
          child: FadeInImage(
            fit: BoxFit.cover,
            placeholder: MemoryImage(Uint8List(0)),
            placeholderErrorBuilder:
                (context, error, stackTrace) =>
                    const Center(child: CircularProgressIndicator.adaptive()),
            image: itemPictureProvider(widget.avatar.value),
          ),
        ),
      );
    }

    if (widget.isHero) {
      return Hero(
        key: Key(widget.avatar.toString()),
        tag: widget.avatar,
        child: child,
      );
    }

    return child;
  }
}
