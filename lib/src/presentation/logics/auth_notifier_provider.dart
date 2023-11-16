import 'package:dayder/features/authentication/authentication.dart';
import 'package:dayder/src/presentation/logics/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

final authNotifierProvider =
    StateNotifierProvider.autoDispose<AuthStateNotifier, AuthState>((ref) {
  final authState = ref.watch(authProvider);
  return AuthStateNotifier(authState);
});

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier(super.state);

  final _getIt = GetIt.instance;

  String _verificationId = '';

  Future<void> login(String smsCode) async {
    await _getIt<FirebaseAuthentication>()
        .signInWithPhoneBy(_verificationId, smsCode);
    state = AuthState.isLogin;
  }

  Future<void> verifyPhone(String number) async {
    await _getIt<FirebaseAuthentication>().verifyPhone(number,
        (verificationId, numberOfVerification) {
      _verificationId = verificationId;
      state = AuthState.isCodeVerification;
    });
  }

  Future<void> logout() async {
    await _getIt<FirebaseAuthentication>().logout();
    state = AuthState.isLogout;
  }

  update(AuthState state) {
    this.state = state;
  }
}
