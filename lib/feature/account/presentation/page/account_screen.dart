
import 'package:buy_and_dot/core/data/model/user_model.dart';
import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/feature/account/presentation/widget/app_bar.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final UserModel user = UserModel(name: 'Георгий', email: 'examples@yourdomain.com', phoneNamber: '+ 373 777 2 54 97', surName: 'Васильков');
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AccaountAppBar(context: context, userData: user,),
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
              Text('${user.name} ${user.surName}',style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16,),
              const Divider (
                height: 1,
                color:ColorCollection.outlineVariant,
              ),
              
        ],
      ),
    );
    Widget get _emailDataBuilder => Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(S.of(context).email,style: Theme.of(context).textTheme.labelMedium!.copyWith(
        color: ColorCollection.onSurfaceVar
      ),),
      Text(user.email,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: ColorCollection.onSurface
      ),),
    ],
  );

  Widget get _phoneDataBuilder => Column(
    mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(S.of(context).phone,style: Theme.of(context).textTheme.labelMedium!.copyWith(
        color: ColorCollection.onSurfaceVar
      ),),
      Text(user.phoneNamber,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: ColorCollection.onSurface
      ),),
    ],
  );
}
