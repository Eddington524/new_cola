import 'package:flutter/material.dart';
import 'package:new_cola/theme/custom_color.dart';
import 'package:new_cola/widget/item_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoEditPage extends StatefulWidget {
  const InfoEditPage({Key? key}) : super(key: key);

  @override
  State<InfoEditPage> createState() => _InfoEditPageState();
}

class _InfoEditPageState extends State<InfoEditPage> {
  final _nicknameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('프로필 수정'),
        actions: [
            IconButton(onPressed: () {
              saveUserId(id:_nicknameController.text);
              Navigator.pop(context);
            }, icon: Icon(Icons.check)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  ItemImage(
                      width: 120,
                      height: 120,
                      imgUrl:
                          'https://cdn-icons-png.flaticon.com/512/847/847969.png',
                      isCicle: true),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    width: 125,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: CustomColors().mainBlue,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          '프로필 사진 변경',
                          style: TextStyle(color: CustomColors().mainBlue),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '닉네임',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text('0/24'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder(
              future: loadMyInfo(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Map<String, String>? info = snapshot.data;
                  _nicknameController.text = info?['id'] ?? "";
                }
                return TextField(
                  controller: _nicknameController,
                    decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: CustomColors().boxGrey,
                ));
              }
            ),
            SizedBox(height: 20),
            Text(
              '이메일',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                color: CustomColors().boxGrey,
                border: Border.all(
                  width: 1,
                  color: CustomColors().darkGrey,
                ),
                borderRadius: BorderRadius.circular(5)
              ),
              width: double.infinity,
              height: 60,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: FutureBuilder(
                      future: loadMyInfo(),
                      builder: (context, snapshot) {
                        if(snapshot.hasData){
                          Map<String, String>? info = snapshot.data;
                          return Text(info?['email'] ?? "");
                        }else{
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
                      }
                    ),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Future<Map<String, String>> loadMyInfo() async {
    final prefs = await SharedPreferences.getInstance();
    var id = prefs.getString('id') ?? "";
    var email = prefs.getString('email') ?? "";
    return {"id": id, "email": email};
  }

  Future<void> saveUserId({required String id}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('id', id);
  }
}
