import 'package:flutter/cupertino.dart';
import 'package:shop/main.dart';

import '../services/auth_service.dart';
import '../services/firestore_service.dart';
import '../utils/common_methods.dart';
import '../utils/validator.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLogin = false;
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLogin => _isLogin;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  changeToLogin() {
    _isLogin = true;
    notifyListeners();
  }

  changeToSignUp() {
    _isLogin = false;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> signIn(String email, String pwd) async {
    setLoading(true);
    final validator = Validator();

    final emailError = validator.emailValidate(email);
    final pwdError = validator.passwordNullChech(pwd);

    final errors = [
      if (emailError != null) emailError.toString(),
      if (pwdError != null) pwdError.toString(),
    ];
    if (errors.isNotEmpty) {
      setLoading(false);
      flashMsg(MessageType.error, errors);
      return;
    }

    try {
      final authResult =
          await AuthService().signInWithEmailAndPassword(email, pwd);

      if (authResult.success) {
        print("inside if");
        Navigator.pushReplacementNamed(navigatorKey.currentContext!, '/home');
      } else {
        print("error Message ${authResult.error!.message}");
        flashMsg(MessageType.error, [authResult.error!.message]);
      }
    } catch (e) {
      flashMsg(MessageType.error, ["Something went wrong"]);
    } finally {
      setLoading(false);
    }
  }

  Future<void> signUp(String name, String email, String pwd) async {
    setLoading(true);
    final validator = Validator();

    final nameError = validator.nameValidate(name);
    final emailError = validator.emailValidate(email);
    final pwdError = validator.passwordNullChech(pwd);

    final errors = [
      if (nameError != null) nameError.toString(),
      if (emailError != null) emailError.toString(),
      if (pwdError != null) pwdError.toString(),
    ];
    if (errors.isNotEmpty) {
      setLoading(false);
      flashMsg(MessageType.error, errors);
      return;
    }

    try {
      final authResult =
          await AuthService().signUpWithEmailAndPassword(email, pwd);
      if (authResult.success) {
        final firestoreRes = await FirestoreService()
            .createUser(authResult.data!.uid, email, name);
        if (firestoreRes.success) {
          flashMsg(
              MessageType.success, ["Email has been sent for verification"]);
          changeToLogin();
        } else {
          flashMsg(MessageType.error, [firestoreRes.error!.message]);
        }
      } else {
        flashMsg(MessageType.error, [authResult.error!.message]);
      }
    } catch (e) {
      flashMsg(MessageType.error, ["Something went wrong"]);
    } finally {
      setLoading(false);
    }
  }

  Future<void> signOut() async {
    setLoading(true);
    try {
      await AuthService().signOutFromEmail();
      changeToLogin();
      Navigator.pushReplacementNamed(navigatorKey.currentContext!, '/');
    } catch (e) {
      flashMsg(MessageType.error, ["Something went wrong"]);
    } finally {
      setLoading(false);
    }
  }
}
