import 'package:findseat/app/auth_bloc/bloc.dart';
import 'package:findseat/presentation/common_widgets/widget_spacer.dart';
import 'package:findseat/presentation/custom_ui/svg_image.dart';
import 'package:findseat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetHomeToolbar extends StatefulWidget {
  @override
  _WidgetHomeToolbarState createState() => _WidgetHomeToolbarState();
}

class _WidgetHomeToolbarState extends State<WidgetHomeToolbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: COLOR_CONST.BLUE,
      height: 70,
      child: Row(
        children: <Widget>[
          _buildAvatar(),
          _buildNames(),
          _buildActions(),
        ],
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      children: <Widget>[
        MySvgImage(
          path: "assets/ic_search.svg",
          width: 20,
          height: 20,
        ),
        WidgetSpacer(
          width: 12,
        ),
        MySvgImage(
          path: "assets/ic_noti.svg",
          width: 20,
          height: 20,
        ),
        WidgetSpacer(width: 12),
      ],
    );
  }

  Widget _buildNames() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Book seats', style: FONT_CONST.SEMIBOLD_WHITE_16),
          GestureDetector(
            onTap: _clickSignOut,
            child: Opacity(
              child: Row(
                children: <Widget>[
                  Text('Coimbatore', style: FONT_CONST.REGULAR_WHITE_12),
                  Icon(Icons.keyboard_arrow_down, color: COLOR_CONST.WHITE)
                ],
              ),
              opacity: 0.5,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(22)),
          border: Border.all(
            color: Colors.white,
            width: 2.0,
          ),
          image: DecorationImage(image: AssetImage("images/sample_avatar.png")),
        ),
      ),
    );
  }

  _clickSignOut() {
    BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
  }
}
