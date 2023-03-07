import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // SizedBox(
        //   height: MediaQuery.of(context).size.height,
        //   child: Image.asset('assets/background.jpg', fit: BoxFit.cover),
        // ),
        // Form(
        //   key: _formKey,
        //   child: ListView(
        //     children: [
        //       CircleAvatar(
        //         backgroundColor: Colors.white54,
        //         radius: 36,
        //         child: Image.asset('assets/avartar.png')
        //       )
        //     ],
        //   ),
        // )
      ]
    );
  }
}
