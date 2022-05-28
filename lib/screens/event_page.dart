import 'dart:ui';
import 'package:event_page/api/event_page_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  bool _shouldAlertError = false;
  bool isPosting = false;
  String _phnNum = '';

  final TextEditingController _phnNumController = TextEditingController();

  void handlePosting(String val) async {
    setState(() {
      isPosting = true;
      _shouldAlertError = false;
      _phnNumController.text = _phnNum;
    });

    String tmp = val.replaceAll('-', '');
    bool _isPhnNumValid = RegExp(r'^[0-9]{11}$').hasMatch(tmp);

    if (_isPhnNumValid) {
      try {
        await EventPageApi.postPhnNum(
            PhnNumPost(phoneNumber: _phnNum.replaceAll('-', ''))
        );
        setState(() {
          isPosting = false;
          _phnNum = '';
          _phnNumController.text = '';
        });
        if (!mounted) return;
        Navigator.of(context).pushNamed('/home');
      } catch (e) {
        setState(() {
          isPosting = false;
        });
        print(e);
        await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)
                ),
                title: const Text('네트워크 에러',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.w500
                    ),
                ),
                content: const Text('네트워크 에러가 발생하여\n잠시 후 다시 시도해 주시기 바랍니다.',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300
                    )
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('확인')
                  )
                ],
              );
            }
        );
      }
    } else {
      setState(() {
        isPosting = false;
        _shouldAlertError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                        child: SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: MediaQuery.of(context).size.height - 96
                            ),
                            child: IntrinsicHeight(
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
                                          onPressed: () {
                                            Navigator.of(context).pushNamed('/home');
                                          },
                                          child: const Text('L O G O',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 24
                                            ),
                                          )
                                      )
                                  ),
                                  Expanded(
                                      child: Column(
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
                                            Visibility(
                                                visible: !_shouldAlertError,
                                                replacement: SizedBox(
                                                    height: 36,
                                                    child: Column(
                                                        children: const [
                                                          Spacer(),
                                                          Text('올바른 핸드폰 번호를 입력해주세요.',
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight: FontWeight.w500,
                                                                  color: Colors.red
                                                              )
                                                          )
                                                        ]
                                                    )
                                                ),
                                                child: const SizedBox(
                                                    height: 36
                                                )
                                            ),
                                            //responsive
                                            screenWidth > 480 ?
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                    child: SizedBox(
                                                        height: 36,
                                                        child: TextField(
                                                          enabled: !isPosting,
                                                          toolbarOptions: const ToolbarOptions(
                                                              copy: true,
                                                              cut: true,
                                                              paste: true,
                                                              selectAll: true
                                                          ),
                                                          keyboardType: TextInputType.number,
                                                          inputFormatters: [
                                                            MaskedInputFormatter('###-####-####')
                                                          ],
                                                          controller: _phnNumController,
                                                          onChanged: (val) {
                                                            _phnNum = _phnNumController.text;
                                                            setState(() {
                                                              _shouldAlertError = false;
                                                            });
                                                          },
                                                          decoration: InputDecoration(
                                                              enabledBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: !_shouldAlertError ? Colors.white : Colors.red,
                                                                      width: 1
                                                                  ),
                                                                  borderRadius: BorderRadius.circular(0)
                                                              ),
                                                              focusedBorder: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: !_shouldAlertError ? Colors.white : Colors.red,
                                                                      width: 1
                                                                  ),
                                                                  borderRadius: BorderRadius.circular(0)
                                                              ),
                                                              disabledBorder: OutlineInputBorder(
                                                                  borderSide: const BorderSide(
                                                                      color: Colors.grey,
                                                                      width: 1
                                                                  ),
                                                                  borderRadius: BorderRadius.circular(0)
                                                              ),
                                                              contentPadding: const EdgeInsets.all(12.0),
                                                              hintText: '전화번호를 "-" 없이 입력하세요',
                                                              hintStyle: const TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight: FontWeight.w300,
                                                                  color: Colors.white
                                                              )
                                                          ),
                                                          cursorColor: Colors.white,
                                                          textAlign: TextAlign.left,
                                                          style: const TextStyle(
                                                              fontSize: 14,
                                                              color: Colors.white
                                                          ),
                                                        )
                                                    )
                                                ),
                                                const SizedBox(
                                                    width: 24
                                                ),
                                                Visibility(
                                                    visible: !isPosting,
                                                    replacement: SizedBox(
                                                        height: 36,
                                                        child: TextButton(
                                                            style: ButtonStyle(
                                                                splashFactory: NoSplash.splashFactory,
                                                                backgroundColor: MaterialStateProperty.all(Colors.white),
                                                                shape: MaterialStateProperty.all(
                                                                    RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(0)
                                                                    )
                                                                )
                                                            ),
                                                            onPressed: null,
                                                            child: const Padding(
                                                                padding: EdgeInsets.symmetric(horizontal: 22),
                                                                child: SizedBox(
                                                                    height: 18,
                                                                    width: 18,
                                                                    child: CircularProgressIndicator(
                                                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                                                                        strokeWidth: 2
                                                                    )
                                                                )
                                                            )
                                                        )
                                                    ),
                                                    child: SizedBox(
                                                        height: 36,
                                                        child: TextButton(
                                                            style: ButtonStyle(
                                                                backgroundColor: MaterialStateProperty.all(Colors.white),
                                                                shape: MaterialStateProperty.all(
                                                                    RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(0)
                                                                    )
                                                                )
                                                            ),
                                                            onPressed: () {
                                                              handlePosting(_phnNum);
                                                            },
                                                            child: const Text('S U B M I T',
                                                              style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontWeight: FontWeight.w900,
                                                                  fontSize: 12
                                                              ),
                                                            )
                                                        )
                                                    )
                                                )
                                              ],
                                            )
                                                : Column(
                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              children: [
                                                SizedBox(
                                                    height: 36,
                                                    width: double.infinity,
                                                    child: TextField(
                                                      enabled: !isPosting,
                                                      toolbarOptions: const ToolbarOptions(
                                                          copy: true,
                                                          cut: true,
                                                          paste: true,
                                                          selectAll: true
                                                      ),
                                                      keyboardType: TextInputType.number,
                                                      inputFormatters: [
                                                        MaskedInputFormatter('###-####-####')
                                                      ],
                                                      controller: _phnNumController,
                                                      onChanged: (val) {
                                                        _phnNum = _phnNumController.text;
                                                        setState(() {
                                                          _shouldAlertError = false;
                                                        });
                                                      },
                                                      decoration: InputDecoration(
                                                          enabledBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: !_shouldAlertError ? Colors.white : Colors.red,
                                                                  width: 1
                                                              ),
                                                              borderRadius: BorderRadius.circular(0)
                                                          ),
                                                          focusedBorder: OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: !_shouldAlertError ? Colors.white : Colors.red,
                                                                  width: 1
                                                              ),
                                                              borderRadius: BorderRadius.circular(0)
                                                          ),
                                                          disabledBorder: OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                  color: Colors.grey,
                                                                  width: 1
                                                              ),
                                                              borderRadius: BorderRadius.circular(0)
                                                          ),
                                                          contentPadding: const EdgeInsets.all(12.0),
                                                          hintText: '전화번호를 "-" 없이 입력하세요',
                                                          hintStyle: const TextStyle(
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.w300,
                                                              color: Colors.white
                                                          )
                                                      ),
                                                      cursorColor: Colors.white,
                                                      textAlign: TextAlign.left,
                                                      style: const TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white
                                                      ),
                                                    )
                                                ),
                                                const SizedBox(
                                                    height: 24
                                                ),
                                                Visibility(
                                                    visible: !isPosting,
                                                    replacement: SizedBox(
                                                        height: 36,
                                                        child: TextButton(
                                                            style: ButtonStyle(
                                                                splashFactory: NoSplash.splashFactory,
                                                                backgroundColor: MaterialStateProperty.all(Colors.white),
                                                                shape: MaterialStateProperty.all(
                                                                    RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(0)
                                                                    )
                                                                )
                                                            ),
                                                            onPressed: null,
                                                            child: const SizedBox(
                                                                height: 18,
                                                                width: 18,
                                                                child: CircularProgressIndicator(
                                                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                                                                    strokeWidth: 2
                                                                )
                                                            )
                                                        )
                                                    ),
                                                    child: SizedBox(
                                                        height: 36,
                                                        child: TextButton(
                                                            style: ButtonStyle(
                                                                backgroundColor: MaterialStateProperty.all(Colors.white),
                                                                shape: MaterialStateProperty.all(
                                                                    RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(0)
                                                                    )
                                                                )
                                                            ),
                                                            onPressed: () {
                                                              handlePosting(_phnNum);
                                                            },
                                                            child: const Text('S U B M I T',
                                                                style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontWeight: FontWeight.w900,
                                                                    fontSize: 12
                                                                )
                                                            )
                                                        )
                                                    )
                                                )
                                              ],
                                            )
                                          ]
                                      )
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
                              )
                            )
                          )
                        )
                    )
                  ]
              )
          )
        )
    );
  }
}