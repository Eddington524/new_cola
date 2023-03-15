import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:new_cola/main.dart';
import 'package:new_cola/pages/auth/find_password.dart';
import 'package:new_cola/pages/auth/sign_up.dart';
import 'package:new_cola/theme/custom_color.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _idController = TextEditingController();
  final _pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 550,
                ),
                TextField(
                  controller: _idController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: '이메일 또는 아이디를 입력해주세요',
                      hintStyle: TextStyle(
                        color: CustomColors().darkGrey,
                      )),
                ),
                SizedBox(height: 15),
                TextField(
                  obscureText: true,
                  controller: _pwController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: '비밀번호를 입력해주세요',
                      hintStyle: TextStyle(
                        color: CustomColors().darkGrey,
                      )),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(onPressed: () {
                    String id = _idController.text;
                    String pw = _pwController.text;
                    login(id, pw);
                  }, child: Text('로그인')),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.chat_bubble),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_circle_outline),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Signup()));
                    }, child: Text('회원가입'),),
                    TextButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => FindPassword()));
                    }, child: Text('비밀번호 찾기'),)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void login(String id, String pw) async{

    try{
      Response response = await post(
        Uri.parse('http://localhost:3000/login'),
        body: {
          'id': id,
          'password': pw
        }
      );
      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
       // todo user username, profile 이미지 url data 어디에 담을지? 아래 MainPage?
        if(data['token']?.isNotEmpty == true){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainPage()), (route) => false);
        }
        if(data['result'] == 'failed'){
         showAlertDialog();
        }
      }
    }catch(error){
      throw HttpException('Failed to load event: $error');
    }
  }

  void showAlertDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("로그인에 문제가 있으신가요?"),
            content: Text(
              "아이디와 비밀번호를 재확인해주시기 바랍니다\n또는 비밀번호 찾기를 통해 확인 할 수 있습니다",
            ),
            actions:[
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

