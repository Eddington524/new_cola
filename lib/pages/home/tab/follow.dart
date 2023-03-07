import 'package:flutter/material.dart';

class FollowScreen extends StatefulWidget {
  const FollowScreen({Key? key}) : super(key: key);

  @override
  State<FollowScreen> createState() => _FollowScreenState();
}

class _FollowScreenState extends State<FollowScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.purple[200],
        alignment: Alignment.center,
        child: const Text(
          'Tab3 View',
          style: TextStyle(
            fontSize: 30,
          ),
        ));
  }
}
