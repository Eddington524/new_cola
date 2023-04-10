import 'package:flutter/material.dart';
import 'package:new_cola/repository/notifications_repo.dart';
import 'package:new_cola/widget/item_image.dart';

class NotificationsListView extends StatefulWidget {
  const NotificationsListView({Key? key}) : super(key: key);

  @override
  State<NotificationsListView> createState() => _NotificationsListViewState();
}

class _NotificationsListViewState extends State<NotificationsListView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: NotificationsRepo().loadData(),
        builder: (context, snapshot) {
          var list = snapshot.data ?? [];
          return ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 10);
            },
            itemCount: list.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, int index) {
              var item = list[index];
              var now = DateTime.now();
              var before = DateTime.parse(item.createdAt);
              var difference = now.difference(before).inMinutes;
              var due = formatDurationFromMinutes(difference);
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    ItemImage(
                        width: 70,
                        height: 70,
                        imgUrl: '${item.imageUrl}',
                        isCicle: true),
                    SizedBox(
                      width: 7,
                    ),
                    SizedBox(
                      width: 230,
                      height: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${item.title}',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text('${due}'),
                        ],
                      ),
                    ),
                    if (item.sideImageUrl != null &&
                        item.sideImageUrl.isNotEmpty)
                      ItemImage(
                          width: 70,
                          height: 70,
                          imgUrl: '${item.sideImageUrl}',
                          isCicle: false),
                  ],
                ),
              );
            },
          );
        });
  }

  String formatDurationFromMinutes(int minutes) {
    String result = "";
    String twoDigits(int n) => n.toString();
    int years = minutes ~/ (365 * 24 * 60);
    int remainingMinutes = minutes % (365 * 24 * 60);
    int months = remainingMinutes ~/ (30 * 24 * 60);
    remainingMinutes %= (30 * 24 * 60);
    int days = remainingMinutes ~/ (24 * 60);
    remainingMinutes %= (24 * 60);
    int hours = remainingMinutes ~/ 60;
    remainingMinutes %= 60;
    String twoDigitYears = twoDigits(years);
    String twoDigitMonths = twoDigits(months);
    String twoDigitDays = twoDigits(days);
    String twoDigitHours = twoDigits(hours);
    String twoDigitMinutes = twoDigits(remainingMinutes);
    if (years > 0) {
      result = "$twoDigitYears년 전";
    }else if (months > 0 && months <= 12) {
      result = "$twoDigitMonths개월 전";
    }
    else if (days > 0 && days < 31) {
      result = "$twoDigitDays일 전";
    }
    else if (hours > 0 && hours <= 24) {
      result = "$twoDigitHours시간 전";
    }
    else if (minutes > 0 && hours <= 59) {
      result = "$twoDigitMinutes분 전";
    }
    return result;
  }
}
