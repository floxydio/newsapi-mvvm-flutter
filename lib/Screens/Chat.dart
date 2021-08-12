import 'package:flutter/material.dart';
import 'package:learnbloc/models/UserSpec.dart';
import 'package:learnbloc/view_models/DarkMode_vm.dart';
import 'package:learnbloc/view_models/User_vm.dart';
import 'package:provider/provider.dart';
import 'Home_screen.dart';

class Chat extends StatefulWidget {
  const Chat({Key key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserData>(context, listen: false).getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkMode>(
        builder: (context, dark, _) => Scaffold(
            backgroundColor: dark.color,
            body: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: SafeArea(
                child: Column(children: [
                  SizedBox(height: 30),
                  Container(
                    child: Text("Hay! Selamat Membaca",
                        style: TextStyle(color: dark.text, fontSize: 22)),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Dark",
                            style: TextStyle(color: dark.text),
                          ),
                          Switch(
                            activeColor: Colors.blueAccent,
                            inactiveThumbColor: Colors.blueAccent,
                            value: dark.isDark,
                            onChanged: (value) {
                              dark.isDark = value;
                            },
                          ),
                          Text("Light", style: TextStyle(color: dark.text))
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
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
                                    Icon(Icons.home, color: dark.color),
                                    Text(
                                      "Home",
                                      style: TextStyle(color: dark.color),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 40),
                      Consumer<UserData>(
                        builder: (context, user, _) => user.user.isEmpty ||
                                user.user.length == 0
                            ? Column(
                                children: [
                                  Text("Loading..."),
                                  SizedBox(height: 10),
                                  CircularProgressIndicator()
                                ],
                              )
                            : ListView.builder(
                                itemCount: user.user.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Card(
                                    color: dark.color,
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: new Image.network(
                                              user.user[index].pic.medium),
                                          title: Text(
                                            user.user[index].email,
                                            style: TextStyle(color: dark.text),
                                          ),
                                          subtitle: Text(
                                            "${user.user[index].nama.first + user.user[index].nama.last}",
                                            style: TextStyle(color: dark.text),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Center(
                                          child: Text(
                                              "Do you have a news today, Dio?",
                                              style: TextStyle(
                                                  color: Colors.blueAccent)),
                                        ),
                                        SizedBox(height: 10),
                                      ],
                                    ),
                                  );
                                }),
                      )
                    ],
                  ),
                ]),
              ),
            )));
  }
}
