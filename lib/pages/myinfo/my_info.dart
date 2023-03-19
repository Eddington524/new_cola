import 'package:flutter/material.dart';
import 'package:new_cola/pages/Auth/login.dart';
import 'package:new_cola/pages/myinfo/info_edit.dart';
import 'package:new_cola/theme/custom_color.dart';
import 'package:new_cola/widget/item_image.dart';
import 'package:new_cola/widget/my_tag_listview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyInfoPage extends StatefulWidget {
  const MyInfoPage({Key? key}) : super(key: key);

  @override
  State<MyInfoPage> createState() => _MyInfoPageState();
}

class _MyInfoPageState extends State<MyInfoPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내정보'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  '프로필',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextButton(onPressed: () {
                  deleteToken();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                          (route) => false);
                  return;
                }, child: Text('로그아웃')),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ItemImage(
                        width: 70,
                        height: 70,
                        imgUrl:
                            'https://cdn-icons-png.flaticon.com/512/847/847969.png',
                        isCicle: true),
                    SizedBox(
                      width: 7,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder(
                            future: loadMyInfo(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                Map<String, String>? user = snapshot.data;
                                return Text(
                                  user?['id'] ?? "",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                );
                              } else {
                                if(snapshot.hasError){
                                  print("e : ${snapshot.error}");
                                }
                                return Text(
                                  '알수없음',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                );
                              }
                            }),
                        Text('팔로워 0 팔로잉 1'),
                      ],
                    ),
                  ],
                ),
                Container(
                    decoration: BoxDecoration(
                      color: CustomColors().lightOrange,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => InfoEditPage()));
                        },
                        icon: Icon(Icons.edit)))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 25,
            padding: EdgeInsets.only(left: 20),
            child: MytagBoxListView(),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('태그편집'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0), // 원하는 모서리 반지름 값 입력
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '내가 좋아하는 아이템 0',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            //아이템 그리드뷰
          ),
        ],
      ),
    );
  }

  Future<Map<String, String>?> loadMyInfo() async {
    final prefs = await SharedPreferences.getInstance();
    var id = prefs.getString('id') ?? "";
    var email = prefs.getString('email') ?? "";
    return {"id": id, "email": email};
  }

  Future<void> deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}
