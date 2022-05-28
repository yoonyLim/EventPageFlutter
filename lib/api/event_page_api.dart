import 'package:http/http.dart' as http;
import 'dart:convert';

class PhnNumPost {
  final String phoneNumber;

  const PhnNumPost({
    required this.phoneNumber
  });

  Map<String, dynamic> toJson() => {
    'phoneNumber': phoneNumber
  };
}

class EventPageApi {
  static Future<void> postPhnNum(PhnNumPost phnNum) async {
    phnNum.phoneNumber.replaceAll('-', '');
    final url = Uri.parse('http://localhost:8080/api/phone');
    await http.post(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(phnNum.toJson()));
  }
}