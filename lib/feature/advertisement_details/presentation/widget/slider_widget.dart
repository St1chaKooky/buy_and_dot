import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final urlImages = [
    'https://life-trip.ru/wp-content/uploads/2018/06/lanta-klong-nin.jpg',
    'https://life-trip.ru/wp-content/uploads/2018/06/lanta-klong-nin.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CarouselSlider.builder(itemCount: urlImages.length, itemBuilder: (context,index,realindex){
            final urlImage = urlImages[index];
            return buildImage(urlImage,index);
          }, options: CarouselOptions(height: 205))
        ],
      ),
    );
  }
  Widget buildImage(String urlImage, int index) => Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(28)),
    margin: EdgeInsets.symmetric(horizontal: 5),
    child: Image.network(urlImage,fit: BoxFit.cover,),
  );
}