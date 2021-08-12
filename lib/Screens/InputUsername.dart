import 'package:flutter/material.dart';
import 'package:learnbloc/Screens/Home_screen.dart';

class InputUsername extends StatefulWidget {
  const InputUsername({Key key}) : super(key: key);

  @override
  _InputUsernameState createState() => _InputUsernameState();
}

class _InputUsernameState extends State<InputUsername> {
  @override
  Widget build(BuildContext context) {
    TextEditingController namaController = TextEditingController();
    GlobalKey<FormState> _form = GlobalKey<FormState>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
          key: _form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return "Tidak Boleh Kosong";
                  } else {
                    return null;
                  }
                },
                controller: namaController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Nama Anda...",
                    contentPadding: EdgeInsets.only(left: 10)),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    if (_form.currentState.validate()) {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Home(user: namaController.text)));
                    }
                  },
                  child: Text("Masuk"))
            ],
          ),
        ),
      ),
    );
  }
}
