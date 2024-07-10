import 'package:breathin/utils/extensions/widget_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../database/collectionPath.dart';
import '../../../database/db.dart';
import '../../../models/user_model.dart';
import '../../../utils/enums.dart';
import '../../../utils/error_messages.dart';

part 'state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Db db;
  LoginCubit(this.db) : super(const LoginState());

  final FormGroup _form = FormGroup({
    'email': FormControl(validators: [Validators.required, Validators.email]),
    'password': FormControl(validators: [Validators.required, const MinLengthValidator(6)]),
  });
  FormGroup get form => _form;
  toggleRemember(v) => emit(state.copyWith(rememberMe: !state.rememberMe));
  togglePasswordObscuring() => emit(state.copyWith(isObscured: !state.isObscured));
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void processLoginIfValid() {
    if (state.status == AuthStatus.processing) {
      "Already Processing Login Request".showMessage;
    } else {
      if (form.valid) {
        emit(state.copyWith(status: AuthStatus.processing));
        login();
      } else {
        form.markAllAsTouched();
      }
    }
  }

  Future<void> login() async {
    try {
      await _auth.signInWithEmailAndPassword(email: _form.control('email').value, password: _form.control('password').value).then((user) async {
        if (user.user != null) {
          try {
            emit(state.copyWith(currentUser: await db.getDocumentById(collectionPath: CollectionPath.users, documentId: user.user!.uid, fromJson: UserModel.fromJson)));
          } catch (e) {
            //
          }
        }
        emit(state.copyWith(status: AuthStatus.successful));
      }).onError((error, stackTrace) {
        emit(state.copyWith(status: AuthStatus.hasError, message: error.toString(), details: ""));
      });
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.hasError, message: ErrorMessages.somethingWentWrong, details: e.toString()));
    }
  }
}
