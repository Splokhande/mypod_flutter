import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mypod_client/mypod_client.dart';
import 'package:mypod_flutter/main.dart';

var userPod = ChangeNotifierProvider((ref) => UserController(ref));

class UserController extends ChangeNotifier {
  Ref ref;
  UserController(this.ref);
  addUser() async {
    Members user = Members(
      name: 'Saiprasad Lokhande',
      age: 26,
      mobile: '9619311079',
      email: '7208851286sv@gmail.com',
      aadharNo: '9930658744156',
      panNo: 'ATAPL3244L',
      dob: DateTime(1996, 12, 12),
      blockCount: 0,
      isActive: true,
      mobileModel: '',
      status: true,
    );

    try {
      var result = await client.members.addMembers(user);
      if (result) {
        Fluttertoast.showToast(msg: 'User added');
      } else {
        Fluttertoast.showToast(msg: 'Operation failed');
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
