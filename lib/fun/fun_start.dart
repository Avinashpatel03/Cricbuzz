import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket/login/account.dart';
import 'package:firebase_auth/firebase_auth.dart';

class fun_start {
  static Uint8List? unit8List;

  static getdata() async {
    if (FirebaseAuth.instance.currentUser == null) {
      account.login = false;
    } else {
      account.login = true;
      account.uid_ = FirebaseAuth.instance.currentUser?.uid;
      await FirebaseFirestore.instance
          .collection('userdata')
          .doc(account.uid_)
          .get()
          .then((value) => {
                account.email_ = value.data()!['email'],
                account.fname_ = value.data()!['fname'],
                account.image_ =
                    Uint8List.fromList(value.data()!['image'].codeUnits),
                account.lname_ = value.data()!['lname'],
                account.num_ = value.data()!['num'],
                account.password_ = value.data()!['password'],
              });
    }
  }
}
