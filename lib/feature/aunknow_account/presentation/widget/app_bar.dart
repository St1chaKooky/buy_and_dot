
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UnknowAccaountAppBar extends AppBar {
  UnknowAccaountAppBar({
    super.key,
    required BuildContext context,
  }) : super(
            leading: IconButton(
                onPressed: context.pop,
                icon: const Icon(Icons.arrow_back_outlined)),
            automaticallyImplyLeading: true,
            title: Text('Профиль', style: Theme.of(context).textTheme.titleLarge,));
}
