import 'package:event_page/screens/event_page.dart';
import 'package:event_page/screens/home.dart';
import 'package:flutter/cupertino.dart';

final routes = {
  '/': (BuildContext context) => const Home(),
  '/event-page': (BuildContext context) => const EventPage()
};