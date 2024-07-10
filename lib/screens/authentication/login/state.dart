part of 'cubit.dart';

class LoginState extends Equatable {
  final bool rememberMe;
  final bool isObscured;
  final AuthStatus status;
  final String message;
  final String details;
  final UserModel? currentUser;
  const LoginState({this.currentUser, this.message = "", this.details = "", this.status = AuthStatus.initial, this.isObscured = true, this.rememberMe = true});
  LoginState copyWith({UserModel? currentUser, String? message, String? details, AuthStatus? status, bool? isObscured, bool? rememberMe}) {
    return LoginState(
      currentUser: currentUser ?? this.currentUser,
      status: status ?? this.status,
      message: message ?? this.message,
      details: details ?? this.details,
      rememberMe: rememberMe ?? this.rememberMe,
      isObscured: isObscured ?? this.isObscured,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [currentUser, status, message, details, isObscured, rememberMe];
}
