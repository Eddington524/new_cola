import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:new_cola/pages/Auth/login.dart';
import 'package:new_cola/widget/tags_gridview.dart';

class TagSelect extends StatefulWidget {
  final email;
  final id;
  final password;

  const TagSelect({Key? key, this.email, this.id, this.password})
      : super(key: key);

  @override
  State<TagSelect> createState() => _TagSelectState();
}

class _TagSelectState extends State<TagSelect> {
  late bool startBtnIsActive = false;
  late List<String> tags = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              '관심있는 태그 3개 이상 선택해주세요',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
              child: TagsGridviewPage(
                  toggleStartBtnActive: toggleStartBtnActive,
                  updateTagsState: updateTagsState)),
          SizedBox(
            height: 100,
          )
        ],
      ),
      bottomSheet: Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '가입하기를 누르시면 cola의 \n 이용약관 개인정보 처리방침에 동의하게 됩니다.',
              textAlign: TextAlign.center,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      signUp(widget.id, widget.password, widget.email, tags);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: startBtnIsActive
                          ? Colors.lightBlueAccent
                          : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(18.0), // 원하는 모서리 반지름 값 입력
                      ),
                    ),
                    child: Text('시작하기')))
          ],
        ),
      ),
    );
  }

  void toggleStartBtnActive(bool enabled) {
    setState(() {
      startBtnIsActive = enabled;
    });
  }

  void updateTagsState(List<String> selectedtags) {
    setState(() {
      tags = selectedtags;
    });
  }

  void signUp(
      String id, String password, String email, List<String> tags) async {
    print(tags);
    print(id);
    // var body = json.encode(data);
    try {
      Response response = await post(Uri.parse('http://localhost:3000/signup'),
          body: {'id': id, 'password': password, 'email': email, 'tags': jsonEncode(tags)});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        if (data['msg'] == 'sign up sucesss') {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Login()),
              (route) => false);
          return;
        }
        if (data['result'] == 'failure' && data['msg'] == 'unknown error') {
          showAlertDialog();
        }
      }
    } catch (error) {
      throw HttpException('Failed to load event: $error');
    }
  }

  void showAlertDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("시스템상 오류가 발생하였습니다"),
            //
            content: Text(
              "네트워크 또는 알수없는 오류가 발생하여, 다시 시도해주시기 바랍니다",
            ),
            actions: [
              TextButton(
                child: Text("다시 시도"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
