import 'package:flutter/material.dart';
import 'package:learnbloc/Service/Api_Service.dart';
import 'package:learnbloc/models/UserModel.dart';
import 'package:learnbloc/models/UserSpec.dart';
import 'package:learnbloc/view_models/User_Listvm.dart';

class UserData extends ChangeNotifier {
  List<UserViewModel> user = [];

  Future<void> getUser() async {
    List<UserSpec> dataUser = await ApiService().listUser();
    print("Data Pada ${dataUser}");
    this.user =
        dataUser.map((article) => UserViewModel(spec: article)).toList();
    notifyListeners();
  }
}
