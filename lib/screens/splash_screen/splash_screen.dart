import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news/screens/home_news/home_news.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState()  {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (builder) {
            return HomeScreen();
          }));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Image.asset('assets/images/55.jpg',));
  }
}
