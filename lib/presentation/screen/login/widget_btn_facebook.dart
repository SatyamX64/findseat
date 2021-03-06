import 'package:findseat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WidgetBtnFacebook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: COLOR_CONST.FACEBOOK_BTN,
            border: Border.all(
              width: 0.2,
              color: COLOR_CONST.FACEBOOK_BORDER_BTN,
            ),
            shape: BoxShape.rectangle),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: SvgPicture.asset(
                'assets/ic_facebook.svg',
                width: 24,
                height: 24,
              ),
            ),
            Text(
              'Facebook',
              style: FONT_CONST.REGULAR_GRAY4_12,
            )
          ],
        ),
      ),
    );
  }
}
