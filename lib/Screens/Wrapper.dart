import 'package:firstapp/Screens/home.dart';
import 'package:firstapp/authenticate/main_auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firstapp/models/user.dart';

import 'google_map.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    if (user == null) {
      return Authentication();
    } else {
      return MapScreen();
    }
  }
}
