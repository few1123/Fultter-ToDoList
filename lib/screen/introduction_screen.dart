import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'Fresh Food',
      body: 'Lorem ip sum dolor sit amet. consectetuer adipiscing elit Aenean commodo ligula eget dolor.',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 8,
        ),
        onPressed: () {},
        child: const Text('Let s Go'),
        ),
      ),
      image: Image.network('https://img.pikbest.com/png-images/qianku/seafood-gourmet-hot-pot-cartoon-design_2383291.png!sw800'),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    PageViewModel(
      title: 'Fast Delivery',
      body: 'Food is delivered quickly and conveniently for customers.',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 8,
        ),
        onPressed: () {},
        child: const Text('Let s Go'),
        ),
      ),
      image: Image.network('https://png.pngtree.com/png-clipart/20230914/original/pngtree-food-delivery-vector-png-image_12155701.png'),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    PageViewModel(
      title: 'Easy Payment',
      body: 'Payment process You can pay through your bank via the store QR Code',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 8,
        ),
        onPressed: () {},
        child: const Text('Let s Go'),
        ),
      ),
      image: Image.network('https://png.pngtree.com/png-clipart/20190905/ourmid/pngtree-mobile-payment-png-image_1725376.jpg'),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('On Boarding'),
        centerTitle: true,
      ),
      body: IntroductionScreen(
        pages: pages,
        showSkipButton: true,
        skip: const Text('Skip'),

        showDoneButton: true,
        done: const Text('Done'),

        showNextButton: true,
        next: const Icon(Icons.arrow_forward, size: 25,),

        onDone: () => onDone(context),
        curve:Curves.bounceOut,
        dotsDecorator: const DotsDecorator(
          size: Size(15, 15),
          color: Colors.blue,
          activeColor: Colors.orange,
          activeSize: Size.square(20),
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(context, 
    MaterialPageRoute(
      builder: (context) =>  HomeScreen(),
    ),
    );
  }
}