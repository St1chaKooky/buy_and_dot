import 'package:buy_and_dot/feature/account/presentation/widget/edit_app_bar.dart';
import 'package:buy_and_dot/feature/account/presentation/widget/text_field.dart';

import 'package:flutter/material.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: EditAccountAppBar(context: context,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            picureDataBuilder,
           SizedBox(height: 24,),

           AccountTextField(textEditingController: textEditingController,),
           SizedBox(height: 20,),
           AccountTextField(textEditingController: textEditingController,),
           SizedBox(height: 20,),

           AccountTextField(textEditingController: textEditingController,),
           SizedBox(height: 20,),

           AccountTextField(textEditingController: textEditingController,),

          ],
        ),
      ),
    );
    
  }
    Widget get picureDataBuilder => Center(
      child: Column(
        children: [
          Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                          'https://static.dw.com/image/64742971_804.jpg',
                        ),
                        fit: BoxFit.cover)),
              ),
        ],
      ),
    );
    
  
}
