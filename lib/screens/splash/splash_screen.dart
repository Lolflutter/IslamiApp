import 'package:eslami/screens/pageview/Initial_pages.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'SplashScreen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration( seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => InitialPages()),
      );
    });
    return  Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            'assets/splash_screen/Rectangle 1.png',
            fit: BoxFit.cover,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Container(
                  margin: EdgeInsets.all(50),
                  child: Image.asset('assets/splash_screen/Mosque-01 1.png',
                      fit: BoxFit.cover),
                )),
            SizedBox(
              height: 70,
            ),
            Image.asset('assets/splash_screen/OBJECTS.png', fit: BoxFit.cover),
            Image.asset('assets/splash_screen/Islami.png'),
            Spacer(),
          ],
        ), //center column
        Column(
          children: [
            Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: 200),
                  child: Image.asset('assets/splash_screen/Shape-07 1.png'),
                ),
              ],
            )
          ],
        ), //left column
        Positioned(
          right: 0,
          child: Column(
            children: [
              Image.asset('assets/splash_screen/Glow.png'),
              Padding(
                padding: EdgeInsets.only(top:300 ),
                child: Image.asset('assets/splash_screen/Shape-04 1.png'),
              )

            ],
          ),
        )//right column
      ],
    );;
  }
}
