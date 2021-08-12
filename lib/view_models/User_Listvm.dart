import 'package:learnbloc/models/ArticleModel.dart';
import 'package:learnbloc/models/UserSpec.dart';

class UserViewModel {
  UserSpec _spec;

  UserViewModel({UserSpec spec}) : _spec = spec;

  Name get nama {
    return _spec.name;
  }

  String get email {
    return _spec.email;
  }

  Picture get pic {
    return _spec.picture;
  }
}
