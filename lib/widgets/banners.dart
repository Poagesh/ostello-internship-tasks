import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NewsCarousel extends StatelessWidget {
  final List<String> imgList = [
    'assets/banner1.png',
    'assets/banner2.png',
    'assets/banner3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imgList.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(imgList[index]),
              fit: BoxFit.cover, 
            ),
          ),
          
          height: 120, 
          width: MediaQuery.of(context).size.width - 24, 
        );
      },
      options: CarouselOptions(
        height: 120,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.easeInOut,
        enlargeCenterPage: true,
      ),
    );
  }
}
