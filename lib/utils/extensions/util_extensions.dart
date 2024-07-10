import 'package:firebase_auth/firebase_auth.dart';

extension UtilExtensions on String {
  String get png => "assets/images/$this.png";
  String get jpeg => "assets/images/$this.jpeg";
  String get svg => "assets/images/$this.svg";
  bool get isMe => (FirebaseAuth.instance.currentUser == null ? "" : FirebaseAuth.instance.currentUser!.uid) == this;
  bool get isNotCancelled => !toLowerCase().contains('cancel');
  bool get isCancelled => toLowerCase().contains('cancel');

  String safeString({int? length}) => "${substring(0, this.length > (length ?? 15) ? (length ?? 15) : this.length)}${this.length > (length ?? 15) ? ".." : ""}";
}
