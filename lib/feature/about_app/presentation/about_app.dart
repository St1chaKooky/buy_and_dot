import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});
  Widget _textCategory({required String startText,required String endText,required BuildContext context}){
   return   Wrap(
     children: [
       Row(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           const Padding(
               padding: EdgeInsets.only(top:8),
               child: Icon(Icons.circle, size: 8, color: ColorCollection.onSurfaceVar)),
           const SizedBox(width: 8),
           Expanded(
             child: RichText(
               text: TextSpan(
                 children: <TextSpan>[
                   TextSpan(text: startText, style: Theme.of(context).textTheme.labelLarge),
                   TextSpan(text: endText, style: Theme.of(context).textTheme.bodyMedium!.apply(color: ColorCollection.onSurfaceVar)),
                 ],
               ),
             ),
           ),
         ],
       ),
     ],
   );
 }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('О приложении'),
        leading: IconButton(
            onPressed: context.pop,
            icon: const Icon(Icons.arrow_back_outlined)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
  text: TextSpan(
    children: <TextSpan>[
      TextSpan(text: 'Добро пожаловать в ', style: Theme.of(context).textTheme.bodyMedium),
      TextSpan(text: 'Купи - и точка!', style: Theme.of(context).textTheme.labelLarge), // Apply desired style here
      TextSpan(text: ' – ваш универсальный помощник в мире объявлений! Наше приложение предоставляет удобный и безопасный способ купить или продать практически что угодно, от бытовой техники до недвижимости и автомобилей.', style: Theme.of(context).textTheme.bodyMedium),
    ],
  ),
),
            const SizedBox(height: 8,),
            Text(
              'Здесь вы найдете широкий выбор товаров и услуг, предлагаемых как частными лицами, так и компаниями. Будь то поиск квартиры, покупка машины или выбор исполнителя для домашних работ – все это доступно в несколько кликов.',
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            ),
            const SizedBox(height: 8,),
            Text('Особенности приложения:',style: Theme.of(context).textTheme.bodyLarge,),
            const SizedBox(height: 8,),
            _textCategory(startText: "Разнообразие Категорий: ", endText: 'От недвижимости и автомобилей до бытовой техники и одежды.', context: context,),
              _textCategory(startText: 'Поиск и Фильтры: ', endText: 'Настройте фильтры поиска, чтобы быстро найти то, что вам нужно.', context: context),
              _textCategory(startText: 'Безопасность: ', endText: 'Мы прилагаем все усилия, чтобы сделать сделки безопасными и прозрачными.', context: context,),
              _textCategory(startText: 'Легкость Публикации Объявлений: ', endText: 'Продавайте ваши товары, публикуя объявления легко и быстро.', context: context),
              _textCategory(context: context, startText: 'Личный Кабинет:', endText: ' Управляйте своими объявлениями и настройками через персональный аккаунт.',),
            const SizedBox(height: 8,),
RichText(
  text: TextSpan(
    children: <TextSpan>[
      TextSpan(text: 'В ', style: Theme.of(context).textTheme.bodyMedium),
      TextSpan(text: 'Купи - и точка!', style: Theme.of(context).textTheme.labelLarge),
      TextSpan(text: ' мы стремимся предоставить вам лучший опыт покупок и продаж. Постоянные обновления и улучшения делают наше приложение еще удобнее и функциональнее.', style: Theme.of(context).textTheme.bodyMedium),
    ],
  ),
),
            const SizedBox(height: 8,),
            RichText(
  text: TextSpan(
    children: <TextSpan>[
      TextSpan(text: 'Спасибо, что выбрали ', style: Theme.of(context).textTheme.bodyMedium),
      TextSpan(text: 'Купи - и точка!', style: Theme.of(context).textTheme.labelLarge),
      TextSpan(text: '. Мы рады помочь вам сделать удачные сделки.', style: Theme.of(context).textTheme.bodyMedium),
    ],
  ),
),

          ],
        ),
      ),
    );
  }
}
