import 'package:flutter/material.dart';
import 'package:learnbloc/Screens/Home_screen.dart';
import 'package:learnbloc/view_models/DarkMode_vm.dart';
import 'package:learnbloc/view_models/User_vm.dart';
import 'package:provider/provider.dart';
import './view_models/News_vm.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => DarkMode()),
        ChangeNotifierProvider(
          create: (context) => NewsArticleListViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserData()
        ),
      ], child: Home(),),
    ));
