part of 'base.dart';

mixin ImgGenIconNames {
  static const google = "assets/icons/svg/google.svg";
  static const apple = "assets/icons/svg/apple.svg";
  static const email = "assets/icons/svg/email.svg";
  static const back = "assets/icons/svg/back.svg";

  // newly added
  static const notVisible = "assets/icons/svg/notvisiable.svg";
  static const visible = "assets/icons/svg/visiable.svg";
  static const close = "assets/icons/svg/close.svg";

  static const next = "assets/icons/svg/forward.svg";
}

mixin AppIcons {
  static ColorFilter? _color(BuildContext context, Color? color) {
    return ColorFilter.mode(
      color ??
          IconTheme.of(context).color ??
          DefaultTextStyle.of(context).style.color ??
          AppColors.primary,
      BlendMode.srcIn,
    );
  }

  static Widget name(String name, {double? size, Color? color}) =>
      _widget(name, size: size, color: color);

  static Widget _widget(String name, {double? size, Color? color}) => Builder(
    key: ValueKey(name),
    builder: (context) {
      final s = size ?? IconTheme.of(context).size ?? 20;
      return SvgPicture.asset(
        name,
        width: s,
        height: s,
        colorFilter: _color(context, color),
      );
    },
  );

  static Widget pwdVisibility(bool visible, {double? size, Color? color}) =>
      _widget(visible ? ImgGenIconNames.visible : ImgGenIconNames.notVisible);

  static Widget close({double? size, Color? color}) =>
      _widget(ImgGenIconNames.close, size: size, color: color);

  static Widget back({double? size, Color? color}) =>
      _widget(ImgGenIconNames.back, size: size, color: color);

  static Widget google({double? size, Color? color}) =>
      _widget(ImgGenIconNames.google, size: size, color: color);

  static Widget apple({double? size, Color? color}) =>
      _widget(ImgGenIconNames.apple, size: size, color: color);

  static Widget email({double? size, Color? color}) =>
      _widget(ImgGenIconNames.email, size: size, color: color);
}
