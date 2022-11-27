import 'package:flutter/material.dart';

class GoGoTable extends StatelessWidget {
  const GoGoTable({super.key});
  // Color borderColor = const Color(0xFFECEDED);
  final Color borderColor = Colors.grey;
  // final double borderWidth = 0.2;
  final double borderWidth = 1.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // return Container(
      //   color: Colors.teal[100],
      width: 400,
      // height: 400,
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.green[100],
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                              color: borderColor, width: borderWidth),
                          top: BorderSide(
                              color: borderColor, width: borderWidth),
                          right: BorderSide(
                              color: borderColor, width: borderWidth),
                          bottom: BorderSide(
                              color: borderColor, width: borderWidth),
                        ),
                      ),
                      child: const Text(
                        '분류',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              color: borderColor, width: borderWidth),
                          right: BorderSide(
                              color: borderColor, width: borderWidth),
                          bottom: BorderSide(
                              color: borderColor, width: borderWidth),
                        ),
                      ),
                      child: const Text(
                        '서비스',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              color: borderColor, width: borderWidth),
                          right: BorderSide(
                              color: borderColor, width: borderWidth),
                          bottom: BorderSide(
                              color: borderColor, width: borderWidth),
                        ),
                      ),
                      child: const Text(
                        '요금',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 45,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                              color: borderColor, width: borderWidth),
                          right: BorderSide(
                              color: borderColor, width: borderWidth),
                          bottom: BorderSide(
                              color: borderColor, width: borderWidth),
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        '검사',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                    color: borderColor, width: borderWidth),
                                bottom: BorderSide(
                                    color: borderColor, width: borderWidth),
                              ),
                            ),
                            child: const Text(
                              '전화 (수신시)',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                    color: borderColor, width: borderWidth),
                                bottom: BorderSide(
                                    color: borderColor, width: borderWidth),
                              ),
                            ),
                            child: const Text(
                              '응답 완료',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                    color: borderColor, width: borderWidth),
                                bottom: BorderSide(
                                    color: borderColor, width: borderWidth),
                              ),
                            ),
                            child: const Text(
                              '100원/건',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                    color: borderColor, width: borderWidth),
                                bottom: BorderSide(
                                    color: borderColor, width: borderWidth),
                              ),
                            ),
                            child: const Text(
                              '2000원/건',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 45,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                              color: borderColor, width: borderWidth),
                          right: BorderSide(
                              color: borderColor, width: borderWidth),
                          bottom: BorderSide(
                              color: borderColor, width: borderWidth),
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        '개인정보동의',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                    color: borderColor, width: borderWidth),
                                bottom: BorderSide(
                                    color: borderColor, width: borderWidth),
                              ),
                            ),
                            child: const Text(
                              '전화 (수신시)',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                    color: borderColor, width: borderWidth),
                                bottom: BorderSide(
                                    color: borderColor, width: borderWidth),
                              ),
                            ),
                            child: const Text(
                              '응답 완료',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                    color: borderColor, width: borderWidth),
                                bottom: BorderSide(
                                    color: borderColor, width: borderWidth),
                              ),
                            ),
                            child: const Text(
                              '100원/건',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                    color: borderColor, width: borderWidth),
                                bottom: BorderSide(
                                    color: borderColor, width: borderWidth),
                              ),
                            ),
                            child: const Text(
                              '300원/건',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 45,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                              color: borderColor, width: borderWidth),
                          right: BorderSide(
                              color: borderColor, width: borderWidth),
                          bottom: BorderSide(
                              color: borderColor, width: borderWidth),
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        '문자',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                    color: borderColor, width: borderWidth),
                                bottom: BorderSide(
                                    color: borderColor, width: borderWidth),
                              ),
                            ),
                            child: const Text(
                              'SMS 단문',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                    color: borderColor, width: borderWidth),
                                bottom: BorderSide(
                                    color: borderColor, width: borderWidth),
                              ),
                            ),
                            child: const Text(
                              'LMS 장문',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                    color: borderColor, width: borderWidth),
                                bottom: BorderSide(
                                    color: borderColor, width: borderWidth),
                              ),
                            ),
                            child: const Text(
                              '20원/건',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                    color: borderColor, width: borderWidth),
                                bottom: BorderSide(
                                    color: borderColor, width: borderWidth),
                              ),
                            ),
                            child: const Text(
                              '40원/건',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
