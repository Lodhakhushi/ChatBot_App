import 'dart:async';

import 'package:chat_bot_app/screens/chat_screen.dart';
import 'package:chat_bot_app/screens/initial_page.dart';
import 'package:chat_bot_app/utils/util_helper.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
 void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return InitialPage();
      },));
    });
  }
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;
    var screenheight = screensize.height;
    var screenwidth = screensize.width;
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Center(
        child: Container(
          width: orientation == Orientation.portrait
              ? screensize.width * 0.8
              : screensize.width * 0.4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: orientation == Orientation.portrait
                ? Colors.white.withOpacity(0.5)
                : Colors.white.withOpacity(0.5),
          ),
          child: SizedBox(
            width: screenwidth * 0.2,
            height: screenheight * 0.2,
            child: Image.asset(
              'assets/images/ic_logo.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
