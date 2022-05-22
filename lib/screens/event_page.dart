import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Stack(
              children: [
                Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/img.jpg"),
                            fit: BoxFit.cover
                        )
                    )
                ),
                Container(
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.5)
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'EVENT PAGE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34
                          )
                        ),
                        SizedBox(
                          height: 40
                        ),
                        SizedBox(
                            height: 40,
                            width: 200,
                            child: TextField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(),
                                  hintText: '전화번호를 "-" 없이 입력하세요!',
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF898989)
                                  )
                              ),
                            )
                        )
                      ]
                    ),
                    Container(
                        width: 400,
                        height: 400,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/iphone.png"),
                                fit: BoxFit.cover
                            )
                        )
                    )
                  ]
                )
              ]
            )
        )
    );
  }
}