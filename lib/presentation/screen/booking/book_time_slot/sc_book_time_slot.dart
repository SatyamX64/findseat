import 'package:findseat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:findseat/presentation/screen/booking/barrel_booking.dart';
import 'package:findseat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class BookTimeSlotScreen extends StatelessWidget {
  final items = [
    ItemCineTimeSlot(
      'Arasan Cinemas A/C 2K Dolby',
      'Coimbatore',
      '2.4 miles away',
      [
        ItemTimeSlot('10:00 AM', 10, true),
        ItemTimeSlot('1:30 PM', 13, true),
        ItemTimeSlot('6:30 PM', 6, true),
        ItemTimeSlot('9:30 PM', 21, true),
        ItemTimeSlot('12:30 AM', 0, true),
      ],
    ),
    ItemCineTimeSlot(
      'INOX - Prozone mall',
      'Coimbatore',
      '3.2 miles away',
      [
        ItemTimeSlot('10:00 AM', 10, true),
        ItemTimeSlot('1:30 PM', 13, true),
        ItemTimeSlot('6:30 PM', 6, false),
      ],
    ),
    ItemCineTimeSlot(
      'Karpagam theatres - 4K Dolby Atoms',
      'Coimbatore',
      '4 miles away',
      [
        ItemTimeSlot('10:00 AM', 10, true),
        ItemTimeSlot('1:30 PM', 13, true),
      ],
    ),
    ItemCineTimeSlot(
      'KG theatres - 4K',
      'Coimbatore',
      '4.4 miles away',
      [
        ItemTimeSlot('10:00 AM', 10, true),
        ItemTimeSlot('1:30 PM', 13, true),
        ItemTimeSlot('6:30 PM', 6, true),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              WidgetToolbar.defaultActions(title: 'Black Panther'),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    _buildListCineTimeSlot(),
                    _buildBtnToday(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListCineTimeSlot() {
    return ListView.separated(
      itemBuilder: (context, index) {
        if (index < items.length) {
          var item = items[index];
          return WidgetCineTimeSlot(item);
        } else {
          return WidgetSpacer(height: 55);
        }
      },
      separatorBuilder: (context, index) {
        return WidgetSpacer(
          height: 14,
        );
      },
      itemCount: items.length + 1,
      physics: BouncingScrollPhysics(),
    );
  }

  Widget _buildBtnToday() {
    return Positioned(
      bottom: 0,
      child: Placeholder(
        color: COLOR_CONST.DEFAULT,
        fallbackHeight: 55,
      ),
    );
  }
}

class ItemCineTimeSlot {
  String cineName;
  String textLocation;
  String textDistance;
  List<ItemTimeSlot> timeSlots;

  ItemCineTimeSlot(
      this.cineName, this.textLocation, this.textDistance, this.timeSlots);
}
