import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyStandardIconButton extends StatefulWidget {
  final String iconFromCollection;
  final double widthIcon;
  final double heightIcon;
  final void Function() onIconTap;
  const MyStandardIconButton(
      {super.key,
      required this.iconFromCollection,
      this.widthIcon = 24,
      this.heightIcon = 24,
      required this.onIconTap});

  @override
  State<MyStandardIconButton> createState() => _MyStandardIconButtonState();
}

class _MyStandardIconButtonState extends State<MyStandardIconButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      child: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          width: widget.widthIcon,
          height: widget.heightIcon,
          fit: BoxFit.none,
          widget.iconFromCollection,
        ),
      ),
    );
  }
}
