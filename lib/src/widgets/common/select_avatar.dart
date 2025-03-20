import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:sign_flutter/sign_flutter.dart';
import 'package:utils/utils.dart';

class SelectAvatar extends StatefulWidget {
  const SelectAvatar({super.key, required this.avatar});

  final Signal<Avatar?> avatar;

  @override
  State<SelectAvatar> createState() => _SelectAvatarState();
}

class _SelectAvatarState extends State<SelectAvatar> {
  @override
  void initState() {
    widget.avatar.value ??= Avatar.fromString(randomColor());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        widget.avatar.builder((value) {
          return ImggenUserAvatar(avatar: value!, size: 80);
        }),
        Column(
          children: [
            AppButton(
              size: AppSizeVariant.medium,
              variant: AppButtonVariant.text,
              onPressed: (_) {
                widget.avatar.value = Avatar.fromString(randomColor());
              },
              title: Row(
                children: [Icon(Icons.refresh), Text("Rastgele Renk")],
              ),
            ),
            Text("Veya"),
            AppButton(
              size: AppSizeVariant.medium,
              variant: AppButtonVariant.text,
              onPressed: (_) {},
              title: Row(children: [Icon(Icons.upload), Text("Yükle")]),
            ),
          ],
        ),
      ],
    );
  }
}
