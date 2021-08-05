import 'package:flutter_svg/flutter_svg.dart';
import 'package:findseat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

import '../../app_router.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // openLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: COLOR_CONST.DEFAULT,
        child: Center(
          child: SvgPicture.asset(
            'assets/logo_find_seat.svg',
            color: COLOR_CONST.WHITE,
          ),
        ),
      ),
    );
  }

  void openLogin() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, AppRouter.LOGIN);
    });
  }
}
