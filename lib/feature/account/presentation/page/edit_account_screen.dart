import 'dart:io';

import 'package:buy_and_dot/core/data/model/user_model.dart';
import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/feature/account/presentation/page/edit_account_view_modal.dart';
import 'package:buy_and_dot/feature/account/presentation/widget/edit_app_bar.dart';
import 'package:buy_and_dot/feature/account/presentation/widget/text_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditAccountScreen extends StatefulWidget {
  final ViewModelEditAccount _viewModel;

  final UserModel user;
  const EditAccountScreen({super.key, required this.user, required ViewModelEditAccount viewModel}) : _viewModel = viewModel;

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  ViewModelEditAccount get _viewModel => widget._viewModel;
  UserModel get userData => widget.user;
  late TextEditingController nameTextEditingController =
      TextEditingController(text: userData.name);
  late TextEditingController surNameTextEditingController =
      TextEditingController(text: userData.surName);
  late TextEditingController phoneNumberTextEditingController =
      TextEditingController(text: userData.phoneNamber);
  late TextEditingController emailTextEditingController =
      TextEditingController(text: userData.email);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditAccountAppBar(
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            picureDataBuilder,
            const SizedBox(
              height: 24,
            ),
            AccountTextField(
              textEditingController: nameTextEditingController,
              labelText: S.of(context).userName,
            ),
            const SizedBox(
              height: 20,
            ),
            AccountTextField(
              textEditingController: surNameTextEditingController,
              labelText: S.of(context).surName,
            ),
            const SizedBox(
              height: 20,
            ),
            AccountTextField(
              textEditingController: phoneNumberTextEditingController,
              labelText: S.of(context).phone,
            ),
            const SizedBox(
              height: 20,
            ),
            AccountTextField(
              textEditingController: emailTextEditingController,
              labelText: S.of(context).email,
            ),
          ],
        ),
      ),
    );
  }

  Widget get picureDataBuilder => ValueListenableBuilder(
   valueListenable: _viewModel.isActiveImage,
   builder: (context, value, state) =>
      Center(
          child: _viewModel.isActiveImage.value == null ? Container(
            width: 100,
            height: 100,
  decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://static.dw.com/image/64742971_804.jpg'),
                  fit: BoxFit.cover,
                )
              ),
            child: editPictureButtonBuilder
          ): Container(
            width: 100,
            height: 100,
  decoration:  BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image:  FileImage(File(_viewModel.isActiveImage.value!.path)),
                  fit: BoxFit.cover,
                )
              ),
            child: editPictureButtonBuilder
          )
        )
   
            );

  Widget get editPictureButtonBuilder => Align(
   alignment: Alignment.bottomRight,
   child: SizedBox(
     child: GestureDetector(
       onTap: _viewModel.addNewPhoto,
       child: SvgPicture.asset(
           width: 40,
           height: 40,
           'assets/svg/edit_acc.svg',
           fit: BoxFit.scaleDown),
     ),
   ),
            );
}


