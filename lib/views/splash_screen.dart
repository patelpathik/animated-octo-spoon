import 'dart:async';

import 'package:dogspath/route/routes.dart';
import 'package:dogspath/utils/images.dart';
import 'package:dogspath/utils/size_config.dart';
import 'package:dogspath/utils/theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    new Timer(
      Duration(milliseconds: 5000),
      () => Navigator.pushReplacementNamed(context, Routes.login),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: SizeConfig.screenWidth * 0.35,
              child: Image.asset(Images.welcomeGif),
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 3),
            Text("Dog's Path", style: Theme.of(context).textTheme.headline4),
            SizedBox(height: SizeConfig.safeBlockVertical * 2),
            Text("by", style: AppTheme.defTextStyle()),
            SizedBox(height: SizeConfig.safeBlockVertical * 2),
            FittedBox(
              child: Text(
                "VirtouStack Software Pvt. Ltd.",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
