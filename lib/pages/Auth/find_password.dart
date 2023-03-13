import 'package:flutter/material.dart';
import 'package:new_cola/theme/custom_color.dart';

class FindPassword extends StatefulWidget {

  FindPassword({Key? key}) : super(key: key);

  @override
  State<FindPassword> createState() => _FindPasswordState();
}

class _FindPasswordState extends State<FindPassword> {
  final _idTextController = TextEditingController();

  int number = 1;

  @override
  void initState() {
    super.initState();
    print("init State");
  }

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
        child: Column(children: [
          SizedBox(height: 10,),
          Text('비밀번호를 잊으셨나요?',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
          SizedBox(height: 5,),
          Text(
            '아이디 또는 이메일을 입력하시면 가입하길 때사용하신 메일로\n비밀번호를 재설정할 수 있는 링크를 보내드립니다\n\n아이디 또는 이메일을 잊었을 경우 cs@kr로 문의 부탁드립니다.', style: TextStyle(fontSize: 15,color: CustomColors().darkGrey)),
            SizedBox(height: 10,),
          TextField(
            controller: _idTextController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                hintText: '이메일 또는 아이디를 입력해주세요',
                hintStyle: TextStyle(
                  color: CustomColors().darkGrey,
                )),
          ),
          SizedBox(height: 5,),
          Container(
            width: double.infinity,
            child: ElevatedButton(onPressed: () {
              resetPassWord(_idTextController.text);
              number++;
              setState(() {});
            }, child: Text('확인')),
          )
        ]),
      ),
    );
  }
}

void resetPassWord(String text) {

}
