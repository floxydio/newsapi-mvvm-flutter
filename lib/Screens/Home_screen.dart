import 'package:flutter/material.dart';
import 'package:learnbloc/view_models/DarkMode_vm.dart';
import 'package:learnbloc/view_models/User_vm.dart';
import '../constant.dart';
import 'package:provider/provider.dart';
import '../view_models/News_vm.dart';
import './Chat.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines();
    Provider.of<UserData>(context, listen: false).getUser();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);
    return Consumer<DarkMode>(
      builder: (context, drk, _) => Scaffold(
          backgroundColor: drk.color,
          body: SingleChildScrollView(
              child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Container(
                    child: Text("Hay! Selamat Membaca",
                        style: TextStyle(color: drk.text, fontSize: 22)),
                  ),
                  SizedBox(height: 20),
                  Consumer<DarkMode>(
                    builder: (context, dark, _) => Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Dark",
                              style: TextStyle(color: drk.text),
                            ),
                            Switch(
                              activeColor: Colors.blueAccent,
                              inactiveThumbColor: Colors.blueAccent,
                              value: dark.isDark,
                              onChanged: (value) {
                                dark.isDark = value;
                              },
                            ),
                            Text("Light", style: TextStyle(color: drk.text))
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Chat()));
                              },
                              child: Container(
                                width: 100,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    color: Colors.deepPurpleAccent),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.chat, color: drk.color),
                                      Text(
                                        "Chat",
                                        style: TextStyle(color: drk.color),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 40),
                        Consumer<NewsArticleListViewModel>(
                            builder: (context, ns, _) => ns.articles.isEmpty ||
                                    ns.articles.length == 0
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Loading Data..."),
                                      SizedBox(height: 30),
                                      CircularProgressIndicator(),
                                    ],
                                  )
                                : ListView.builder(
                                    itemCount: 5,
                                    physics: ScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (_, i) {
                                      return ListTile(
                                        title: Text(
                                          ns.articles[i].title,
                                          style: TextStyle(color: dark.text),
                                        ),
                                        contentPadding: EdgeInsets.all(10),
                                        subtitle: Text(
                                          ns.articles[i].description,
                                          style: TextStyle(color: dark.text),
                                        ),
                                      );
                                    },
                                  )),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ))),
    );
  }
}
