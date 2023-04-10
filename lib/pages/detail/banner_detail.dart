import 'package:flutter/material.dart';
import 'package:new_cola/model/event.dart';
import 'package:new_cola/repository/event_repo.dart';
import 'package:new_cola/widget/Box.dart';

class BannerDetailPage extends StatefulWidget {
  final int id;

  const BannerDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<BannerDetailPage> createState() => _BannerDetailPageState();
}

String formattedDate(DateTime date) {
  var dateString = date.toString();
  var dateTime = DateTime.parse(dateString);
  var formattedDate =
      '${dateTime.year}년 ${dateTime.month.toString().padLeft(2, '0')}월 ${dateTime.day.toString().padLeft(2, '0')}일';
  return formattedDate;
}

class _BannerDetailPageState extends State<BannerDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이벤트'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: EventRepo().loadData(widget.id),
            builder: (context, snapshot) {
              var item = snapshot.data ??
                  Event(0, 'detailImgUrl', DateTime.now(), DateTime.now(),
                      DateTime.now(), []);
              var startDate = formattedDate(item.startDate);
              var endDate = formattedDate(item.endDate);
              var prizeDate = formattedDate(item.prizeDate);

              return Column(
                children: [
                  // Image.network(item.detailImgUrl),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    color: Color(0xff34b3c7),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Box(
                            text: '참여기간',
                            w: 80,
                            h: 30,
                            bgColor: Colors.deepOrangeAccent,
                            textColor: Colors.white),
                        Text(
                          '$startDate',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          '~$endDate까지',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(height: 40,),
                        Box(
                            text: '당첨자 발표',
                            w: 80,
                            h: 30,
                            bgColor: Colors.deepOrangeAccent,
                            textColor: Colors.white),
                        Text(
                          '$prizeDate',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          '콜리앱 이벤트 페이지에서 발표',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(height: 40,),
                        Text(
                          '-유의사항-',
                          style: TextStyle(color: Colors.white70, fontSize: 15),
                        ),
                        Text(
                          '복수계정으로 지원하는 부정행위가 발각될 경우에는',
                          style: TextStyle(color: Colors.white70, fontSize: 15),
                        ),
                        Text(
                          '차후 이벤트 참여가 제한 될 수 있습니다',
                          style: TextStyle(color: Colors.white70, fontSize: 15),
                        ),
                        SizedBox(height: 20,),
                        Text(
                          'Apple is not involved in any way with this event',
                          style: TextStyle(color: Colors.white70, fontSize: 15),
                        ),
                        SizedBox(height: 30,),
                      ],
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
