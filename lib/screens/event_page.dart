import 'dart:ui';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
        body: SafeArea(
          child: Center(
              child: Stack(
                  children: [
                    Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/img.jpg"),
                                fit: BoxFit.cover
                            )
                        ),
                        child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                            child: Container(
                                decoration: const BoxDecoration(
                                    color: Color.fromRGBO(0, 0, 0, 0.5)
                                )
                            )
                        )
                    ),
                    Padding(
                        padding: const EdgeInsets.all(48),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: TextButton(
                                  style: ButtonStyle(
                                      splashFactory: NoSplash.splashFactory,
                                      backgroundColor: MaterialStateProperty.all(Colors.black),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(0)
                                          )
                                      )
                                  ),
                                  onPressed: () { },
                                  child: const Text('L O G O',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 24
                                    ),
                                  )
                              )
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // responsive
                                  screenWidth > 480 ?
                                      const Text(
                                          '명품 · 디자이너 브랜드 옷을 빌려줘 수익을 내거나,\n입고 싶었던 옷을 새옷처럼 빌려 입어보세요.',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500
                                          )
                                      )
                                  : const Text(
                                        '명품 · 디자이너 브랜드 옷을\n빌려줘 수익을 내거나,\n입고 싶었던 옷을\n새옷처럼 빌려 입어보세요.',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500
                                        )
                                  ),

                                  const SizedBox(
                                      height: 36
                                  ),
                                  // responsive
                                  screenWidth > 480 ?
                                      const Text(
                                          '휴대폰 번호를 입력하시면 다운로드 정보를 보내드릴게요.',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500
                                          )
                                      )
                                  : const Text(
                                          '휴대폰 번호를 입력하시면\n다운로드 정보를 보내드릴게요.',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500
                                          )
                                  ),
                                  const SizedBox(
                                      height: 36
                                  ),
                                  //resonsive
                                  screenWidth > 480 ?
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Expanded(
                                          child: SizedBox(
                                              height: 36,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.white,
                                                            width: 1
                                                        )
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.white,
                                                            width: 1
                                                        )
                                                    ),
                                                    contentPadding: EdgeInsets.all(12.0),
                                                    hintText: '전화번호를 "-" 없이 입력하세요',
                                                    hintStyle: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w300,
                                                        color: Colors.white
                                                    )
                                                ),
                                                cursorColor: Colors.white,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white
                                                ),
                                              )
                                          )
                                      ),
                                      const SizedBox(
                                          width: 24
                                      ),
                                      SizedBox(
                                          height: 36,
                                          child: TextButton(
                                              style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all(Colors.white),
                                                  shape: MaterialStateProperty.all(
                                                      RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(4)
                                                      )
                                                  )
                                              ),
                                              onPressed: () { },
                                              child: const Text('S U B M I T',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 12
                                                ),
                                              )
                                          )
                                      )
                                    ],
                                  )
                                  : Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      const SizedBox(
                                          height: 36,
                                          width: double.infinity,
                                          child: TextField(
                                            decoration: InputDecoration(
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white,
                                                        width: 1
                                                    )
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white,
                                                        width: 1
                                                    )
                                                ),
                                                contentPadding: EdgeInsets.all(12.0),
                                                hintText: '전화번호를 "-" 없이 입력하세요',
                                                hintStyle: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.white
                                                )
                                            ),
                                            cursorColor: Colors.white,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white
                                            ),
                                          )
                                      ),
                                      const SizedBox(
                                          height: 24
                                      ),
                                      SizedBox(
                                          height: 36,
                                          child: TextButton(
                                              style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all(Colors.white),
                                                  shape: MaterialStateProperty.all(
                                                      RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(4)
                                                      )
                                                  )
                                              ),
                                              onPressed: () { },
                                              child: const Text('S U B M I T',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 12
                                                  ),
                                              )
                                          )
                                      )
                                    ],
                                  )
                                ]
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      color: Colors.black,
                                      padding: const EdgeInsets.all(5),
                                      child: const Text(
                                        'L O G O',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w900
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12
                                    ),
                                    const Text('C O M I N G   S O O N',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 12
                                ),
                                const Text(
                                  '09. 2022',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 36,
                                      fontWeight: FontWeight.w500
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                    )
                  ]
              )
          )
        )
    );
  }
}