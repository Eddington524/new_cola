import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:new_cola/pages/tagselect/tag_select.dart';
import 'package:new_cola/theme/custom_color.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String _email = '';
  String _id = '';
  String _pw = '';
  String _pwConfirm = '';
  // bool _isEnabled = false;
  late Future<bool> isEnabledId;

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'cola에 오신걸 환영해요',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text('사용하실 회원 정보를 입력해주세요',
                  style:
                      TextStyle(fontSize: 17, color: CustomColors().darkGrey)),
              SizedBox(
                height: 20,
              ),
              Text('이메일'),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.always,
                onSaved: (value) {
                  setState(() {
                    _email = value as String;
                  });
                },
                validator: validateEmail,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '자주 사용하는 이메일을 입력해주세요',
                    hintStyle: TextStyle(
                      color: CustomColors().darkGrey,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Text('아이디'),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.always,
                onSaved: (value) {
                  setState(() {
                    _id = value as String;
                  });
                },
                validator: validateId,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '4자~24자 영어,숫자 -,_만 사용가능해요',
                    hintStyle: TextStyle(
                      color: CustomColors().darkGrey,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Text('비밀번호'),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.always,
                onSaved: (value) {
                  setState(() {
                    _pw = value as String;
                  });
                },
                validator: validatePassword,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '2글자 이상 영문과 숫자를 조합해주세요',
                    hintStyle: TextStyle(
                      color: CustomColors().darkGrey,
                    )),
                onChanged: (value) => _pw = value,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.always,
                onSaved: (value) {
                  setState(() {
                    _pwConfirm = value as String;
                  });
                },
                onChanged: (value) => _pwConfirm = value,
                validator: validatePasswordConfirmation,
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
              SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(content: Text('Processing Data')),
                        // );
                        // todo 중복 아이디 체크후 변경한 후 다음 페이지로 이동!
                        // _isEnabled = await checkExistId(_id);
                        // if(_isEnabled){
                        //
                        // }
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TagSelect(
                                    email: _email,
                                    id: _id,
                                    password: _pwConfirm,
                                  )));
                        setState(() {});
                      }
                    },
                    child: Text('다음')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validateEmail(String? value) {
    // 이메일 형식 체크를 위한 정규식
    final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (value == null || value.isEmpty) {
      return '이메일을 입력하세요';
    } else if (!emailRegExp.hasMatch(value)) {
      return '올바른 이메일 형식이 아닙니다';
    }
    return null;
  }

  String? validateId(String? value) {
    // 아이디 형식 체크를 위한 정규식
    final RegExp idRegExp = RegExp(r'^[a-zA-Z0-9_-]{4,24}$');

    if (value == null || value.isEmpty) {
      return '아이디를 입력하세요';
    } else if (!idRegExp.hasMatch(value)) {
      return '4자 ~ 24자의 영어,숫자,-,_ 만 사용 가능합니다';
    }
    return null;
  }

  String? validatePassword(String? value) {
    // 비밀번호 형식 체크를 위한 정규식
    final RegExp passwordRegExp =
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{2,}$');

    if (value == null || value.isEmpty) {
      return '비밀번호를 입력하세요';
    } else if (!passwordRegExp.hasMatch(value)) {
      return '2글자 이상의 영문과 숫자 조합이어야 합니다';
    }
    return null;
  }

  String? validatePasswordConfirmation(String? value) {
    return confirmPassword(_pw, _pwConfirm);
  }

  String? confirmPassword(String? pw, String? pwConfirm) {
    if (pw != pwConfirm) {
      return '비밀번호가 일치하지 않습니다';
    }
    return null;
  }

  Future<bool> checkExistId(String id) async {
    var enabled = false;
    try {
      Response response =
          await post(Uri.parse('http://localhost:3000/checkid'), body: {
        'id': id,
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        if (data['result'] == 'success') {
          enabled = true;
        }
        if (data['result'] == 'failure') {
          enabled = false;
          showAlertDialog();
        }
      }
    } catch (error) {
      throw HttpException('Failed to load event: $error');
    }
    return enabled;
  }

  void showAlertDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("이미 존재하는 아이디 입니다"),
            content: Text(
              "다른 아이디로 다시 시도해주시기 바랍니다",
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
