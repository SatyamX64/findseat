import 'package:findseat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:findseat/presentation/screen/cine_date_picker/barrel_cine_date_picker.dart';
import 'package:findseat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CineDatePickerScreen extends StatefulWidget {
  @override
  _CineDatePickerScreenState createState() => _CineDatePickerScreenState();
}

class CineDatePickerScreenProvider with ChangeNotifier {
  DateTime selectedDate;

  CineDatePickerScreenProvider({required this.selectedDate});

  void onDateSelected(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }
}

class _CineDatePickerScreenState extends State<CineDatePickerScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => CineDatePickerScreenProvider(
          selectedDate: _getStartDate().add(Duration(days: 5))),
      child: Container(
        color: COLOR_CONST.WHITE,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('Friday, Nov 14, 2019',
                  style: FONT_CONST.REGULAR_BLACK2_14),
            ),
            Divider(color: COLOR_CONST.DIVIDER, height: 1),
            _buildListDateByWeek(),
          ],
        ),
      ),
    );
  }

  Widget _buildListDateByWeek() {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 18, top: 13.5, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          WidgetListDateLabel(),
          _buildListWeeks(),
        ],
      ),
    );
  }

  static DateTime _getStartDate() {
    var dNow = DateTime.now();
    return DateTime.utc(dNow.year, dNow.month, dNow.day);
  }

  List<ItemWeek> weeks = [
    ItemWeek(
        'This week',
        List<int>.generate(7, (i) => i + 1)
            .map((day) => _getStartDate().add(Duration(days: day)))
            .toList()),
    ItemWeek(
        'Next week',
        List<int>.generate(7, (i) => i + 1)
            .map((day) => _getStartDate()
                .add((Duration(days: 7)))
                .add(Duration(days: day)))
            .toList())
  ];

  Widget _buildListWeeks() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return WidgetItemWeek(weeks[index]);
      },
      separatorBuilder: (context, index) {
        return WidgetSpacer(height: 16);
      },
      shrinkWrap: true,
      itemCount: weeks.length,
    );
  }
}

class ItemWeek {
  String label;
  List<DateTime> dates = [];

  ItemWeek(this.label, this.dates);
}
