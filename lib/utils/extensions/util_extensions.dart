import 'package:firebase_auth/firebase_auth.dart';

extension UtilExtensions on String {
  String get png => "assets/images/$this.png";
  String get jpeg => "assets/images/$this.jpeg";
  String get svg => "assets/images/$this.svg";
  bool get isMe => (FirebaseAuth.instance.currentUser == null ? "" : FirebaseAuth.instance.currentUser!.uid) == this;
}
