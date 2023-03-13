import 'package:flutter/material.dart';
import 'package:new_cola/theme/custom_color.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Text('cola에 오신걸 환영해요', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
            SizedBox(height: 10,),
            Text('사용하실 회원 정보를 입력해주세요',style: TextStyle(fontSize: 17,color: CustomColors().darkGrey)),
            SizedBox(height: 20,),
            Text('이메일'),
            SizedBox(height: 5,),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '자주 사용하는 이메일을 입력해주세요',
                  hintStyle: TextStyle(
                    color: CustomColors().darkGrey,
                  )),
            ),
            SizedBox(height: 20,),
            Text('아이디'),
            SizedBox(height: 5,),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '4자~24자 영어,숫자 -,_만 사용가능해요',
                  hintStyle: TextStyle(
                    color: CustomColors().darkGrey,
                  )),
            ),
            SizedBox(height: 20,),
            Text('비밀번호'),
            SizedBox(height: 5,),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '8글자 이상 영문과 숫자를 조합해주세요',
                  hintStyle: TextStyle(
                    color: CustomColors().darkGrey,
                  )),
            ),
            SizedBox(height: 10,),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '한번 더 입력해주세요',
                  hintStyle: TextStyle(
                    color: CustomColors().darkGrey,
                  )),
            ),
            SizedBox(height: 40,),
            Container(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(onPressed: () {
              }, child: Text('다음')),
            ),
          ],
        ),
      ),
    );
  }
}
