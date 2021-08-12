import 'package:flutter/material.dart';
import 'package:learnbloc/view_models/DarkMode_vm.dart';
import 'package:learnbloc/view_models/User_vm.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DarkMode()),
        ChangeNotifierProvider(create: (context) => UserData()),
      ],
      
      child: Consumer<DarkMode>(
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
                      child: Text("History Chat",
                          style: TextStyle(color: drk.text, fontSize: 22)),
                    ),
                    SizedBox(height: 20),
                    Consumer<DarkMode>(
                      builder: (context, dark, _) => Column(children: [
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
                                print("Test");
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
                                      Icon(Icons.home, color: drk.color),
                                      Text(
                                        "Home",
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
                        Consumer<UserData>(
                            builder: (context, ud, _) => ListView.builder(
                                itemCount: ud.user.length,
                                shrinkWrap: true,
                                itemBuilder: (_, i) {
                                  return Column(
                                    children: [
                                      ListTile(
                                        leading: new Image.network(
                                            ud.user[i].pic.medium),
                                        title: Text(ud.user[i].email),
                                        subtitle: Text(ud.user[i].nama.first),
                                      ),
                                      Center(
                                          child:
                                              Text("Hey! Do you have a news?"))
                                    ],
                                  );
                                })),
                      ]),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ))),
      ),
    );
  }
}
