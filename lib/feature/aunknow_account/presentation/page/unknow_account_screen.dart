
import 'package:buy_and_dot/feature/aunknow_account/presentation/widget/app_bar.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';

class UnknowAccountScreen extends StatefulWidget {
  const UnknowAccountScreen({super.key});

  @override
  State<UnknowAccountScreen> createState() => _UnknowAccountScreenState();
}

class _UnknowAccountScreenState extends State<UnknowAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: UnknowAccaountAppBar(context: context,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            initialDataBuilder,
            const SizedBox(height: 16,),
            _emailDataBuilder,
            const SizedBox(height: 16,),
            _phoneDataBuilder,
          ],
        ),
      ),
    );
    
  }
    Widget get initialDataBuilder => Center(
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
              const SizedBox(height: 8,),
              Text('Григорий васильков'),
              const SizedBox(height: 16,),
              Container(width: double.infinity,height: 1,color: ColorCollection.outlineVariant,),
        ],
      ),
    );
    Widget get _emailDataBuilder => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('E-mail',style: Theme.of(context).textTheme.labelMedium!.copyWith(
        color: ColorCollection.onSurfaceVar
      ),),
      Text('g.vasilkov@yandex.ru',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: ColorCollection.onSurface
      ),),
    ],
  );

  Widget get _phoneDataBuilder => Column(
    mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Телефон',style: Theme.of(context).textTheme.labelMedium!.copyWith(
        color: ColorCollection.onSurfaceVar
      ),),
      Text('+ 373 777 2 54 97',style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: ColorCollection.onSurface
      ),),
    ],
  );
}
