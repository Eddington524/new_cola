import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: 40,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.black26.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: const [
              Text(
                '01',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
              Text(
                '일',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10),
              ),
            ],
          ),
        ),

        /// : 컨테이너
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 5),
          child: Column(
            children: [
              Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  color:
                  Colors.black26.withOpacity(0.2),
                  borderRadius:
                  BorderRadius.circular(10.0),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  color:
                  Colors.black26.withOpacity(0.2),
                  borderRadius:
                  BorderRadius.circular(10.0),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 50,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.black26.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: const [
              Text(
                '06',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
              Text(
                '시간',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10),
              ),
            ],
          ),
        ),

        /// : 컨테이너
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 5),
          child: Column(
            children: [
              Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  color:
                  Colors.black26.withOpacity(0.2),
                  borderRadius:
                  BorderRadius.circular(10.0),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  color:
                  Colors.black26.withOpacity(0.2),
                  borderRadius:
                  BorderRadius.circular(10.0),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 40,
          height: 30,
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: Colors.black26.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: const [
              Text(
                '43',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
              Text(
                '분',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
